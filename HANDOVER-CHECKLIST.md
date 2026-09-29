# Handover Checklist - v2.1.0

Use this checklist when transferring the project to another developer, operator, or platform team.

## Package integrity
- [ ] `VERSION.txt` shows `2.1.0`.
- [ ] `1-SELF-TEST.cmd` passes.
- [ ] `7-FULL-AUDIT.cmd` passes.
- [ ] `11-HANDOVER-AUDIT.cmd` passes.
- [ ] No `config/bank.json` is included in the distributed ZIP.
- [ ] No `.db`, App Password, SQL hostname, or other secret is bundled.
- [ ] `MANIFEST-SHA256.txt` matches the delivered package contents.

## Knowledge transfer
- [ ] New owner has read `00-HANDOVER-README.md`.
- [ ] New owner has read `docs/ARCHITECTURE-AND-DATA-FLOW.md`.
- [ ] New owner understands UAT vs production boundaries.
- [ ] New owner understands the difference between ReportServer SQL data and the local monitoring database.
- [ ] New owner understands the local Ollama/Qwen Copilot architecture and governed-tool restriction.
- [ ] New owner knows that the one-real-UAT-email route is a test route, not the production mail design.

## Bank UAT
- [ ] Exact SQL Server/instance is supplied privately at runtime, not committed to files.
- [ ] Exact ReportServer database name confirmed by DBA/platform team.
- [ ] `3-BANK-PREFLIGHT.cmd` passes.
- [ ] `database/04_ReportServer_Discovery_ReadOnly.sql` has been reviewed/run in SSMS.
- [ ] Dashboard KPIs reconcile with `database/03_ExecutionLog3_KPI_Validation.sql` for matching windows.
- [ ] Report catalog item types and schedule/running-job tables match the bank PBIRS version.
- [ ] Demo values are not shown in bank UAT mode.

## Mail
- [ ] UAT mail authentication tested only with the dedicated UAT route.
- [ ] If another real UAT mail is required, explicit approval is obtained first.
- [ ] SMTP acceptance is not represented as human read confirmation.
- [ ] Production mailbox/relay decision documented before go-live.

## Production gate
- [ ] Always-on Windows VM/server approved.
- [ ] Least-privilege service identity approved.
- [ ] Production monitoring-state database decision made (SQLite vs approved central SQL migration).
- [ ] Production authentication/SSO designed if access extends beyond localhost.
- [ ] TLS/reverse proxy/security controls approved if exposed beyond the host.
- [ ] Backup, retention, restore, logging, ownership and escalation processes approved.
- [ ] Operational group alerts explicitly approved before enabling.
