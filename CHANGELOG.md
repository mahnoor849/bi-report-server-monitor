# Changelog

## v2.1.0 - Handover Ready
- Comprehensive handover documentation and continuation guide.
- Canonical documentation index, operations runbook, troubleshooting, configuration reference, data dictionary and production gates.
- Fixed root bank preflight so confidential SQL source is loaded through the hidden runtime prompt.
- Aligned package/runtime/browser/health version markers.
- Browser-safe local action errors no longer echo raw internal exception detail.
- Improved SQL KPI validation to scope report inventory consistently.
- Added read-only ReportServer discovery, inventory and schedule/running-job validation scripts.
- Added dedicated handover audit and package checksum manifest.
- Removed obsolete generic local-LLM launcher alias; Ollama/Qwen is the single documented local AI path.

## v2.0.1
- Fixed self-test behavior when Ollama was already running.
- Separated deterministic offline AI fallback test from real local Ollama readiness.

## v2.0.0
- Moved Copilot to local Ollama/Qwen model-driven planning over governed monitoring tools.
- No hard-coded keyword-response chatbot.

Earlier iterations established SQL-only ReportServer monitoring, demo/UAT separation, executive UI, incident/recovery flow, alert retry, redaction and controlled UAT email testing.
