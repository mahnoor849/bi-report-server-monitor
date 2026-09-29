#!/usr/bin/env python3
"""Demo Bank BI Monitoring - zero-third-party bank runtime.

Runs on a bank Windows laptop with Python + built-in PowerShell/.NET only.
No Docker, Node, FastAPI, or external Python packages are required.
"""
import argparse
import threading
import time
import webbrowser

from bank.config import load_config, ConfigError
from bank.core import BankMonitor
from bank.server import Handler, MonitorHTTPServer
from bank.sql_source import DemoSqlSource, PowerShellSqlSource


def scheduler(monitor, stop):
    while not stop.wait(max(5, int(monitor.config.poll_seconds))):
        monitor.run_cycle()


def notification_worker(monitor, stop):
    # Operational email is intentionally separate from the collector so a slow
    # mail server cannot hold the SQL monitoring cycle. UAT defaults keep it idle.
    while not stop.wait(10):
        try:
            monitor.process_alert_outbox(limit=10)
        except Exception:
            pass


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--config", default=None)
    p.add_argument("--no-browser", action="store_true")
    p.add_argument("--once", action="store_true")
    args = p.parse_args()

    try:
        cfg = load_config(args.config)
    except ConfigError as exc:
        print("\nCONFIGURATION ERROR")
        print("=" * 44)
        print(str(exc))
        print("Fix config\\bank.json and run again.\n")
        return 2

    source = DemoSqlSource(cfg) if cfg.is_demo else PowerShellSqlSource(cfg)
    monitor = BankMonitor(cfg, source)
    print("\nDemo Bank BI Monitoring Command Center v2.1.0")
    print("=" * 44)
    print(f"Mode:              {cfg.mode.upper()}")
    print(f"Collector source:  {source.display_name}")
    print("Monitoring store:  CONFIGURED (local path hidden)")
    if not cfg.is_demo:
        print("SQL Server:        CONFIGURED (identity hidden)")
        print(f"ReportServer DB:   {cfg.reportserver_database}")
    print(f"Mail transport:    {'CONFIGURED' if cfg.mail_enabled else 'DISABLED'} (recipient hidden)")
    print(f"Operational mail:  {'ENABLED' if cfg.operational_group_alerts_enabled else 'DISABLED (safe UAT default)'}")
    print(f"Controlled UAT:    {'ENABLED FOR THIS SESSION' if cfg.uat_real_email_enabled else 'DISABLED'}")
    cp_status = monitor.copilot.engine_status()
    print(f"Copilot engine:    {'OLLAMA + QWEN2.5:3B + GOVERNED TOOLS' if cp_status.get('ready') else 'OLLAMA/QWEN NOT READY'}")
    print("External AI API:   NONE (local Ollama only)")

    result = monitor.run_cycle()
    print(f"Initial cycle:     {'PASS' if result.get('ok') else 'FAILED'}")
    if result.get("error"):
        print(f"Reason:            {result['error']}")
        if not result.get("source_verified"):
            print("Dashboard policy:  Bank-source KPIs will show N/A until a real SQL cycle passes.")
        else:
            print("Dashboard policy:  Last verified bank data may be shown as DELAYED, never as Live.")

    if args.once:
        code = 0 if result.get("ok") else 2
        monitor.close()
        return code

    stop = threading.Event()
    t = threading.Thread(target=scheduler, args=(monitor, stop), daemon=True)
    t.start()
    mail_t = threading.Thread(target=notification_worker, args=(monitor, stop), daemon=True)
    mail_t.start()
    try:
        server = MonitorHTTPServer((cfg.host, int(cfg.port)), Handler, monitor)
    except OSError as exc:
        print(f"\nSTARTUP ERROR: Could not open http://{cfg.host}:{cfg.port}")
        print(f"Reason: {exc}")
        print("Close any older BI Monitoring terminal/window and try again.")
        stop.set(); monitor.close()
        return 3

    url = f"http://{cfg.host}:{cfg.port}"
    print(f"Command Center:    {url}")
    print("Version marker:    v2.1.0 (visible in browser header)")
    print(f"Polling:           every {cfg.poll_seconds}s")
    print("Keep this terminal open while the dashboard is running.")
    print("Press Ctrl+C to stop.\n")
    if not args.no_browser:
        threading.Timer(1.0, lambda: webbrowser.open(url)).start()
    try:
        server.serve_forever(poll_interval=.5)
    except KeyboardInterrupt:
        pass
    finally:
        stop.set(); server.shutdown(); server.server_close(); monitor.close()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
