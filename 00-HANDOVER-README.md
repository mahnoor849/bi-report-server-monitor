# Demo Bank BI Monitoring Command Center - Handover Package v2.1.0

## Purpose
This folder is the canonical handover package for the Demo Bank BI Monitoring Command Center created for the AI & Data Science team. It is designed so a new developer/operator can understand what the system does, how to run it, how to validate it, what is already proven, and what still requires bank-environment approval.

## Current status
**UAT / presentation-ready, not production-go-live certified.**

Validated offline in the packaged build:
- core monitoring logic,
- report inventory/lifecycle/health logic,
- refresh grouping and governed KPIs,
- incident and recovery flow,
- alert outbox retry logic,
- controlled one-real-UAT-email safeguards,
- local Ollama + Qwen2.5 integration path,
- executive UI redaction and local service behavior.

Still requires bank-environment validation before production:
- real ReportServer SQL reachability and schema confirmation,
- Windows read permissions,
- KPI reconciliation against SSMS using real data,
- production mailbox/relay,
- always-on VM/service deployment,
- production authentication/SSO if remote access is enabled,
- security/vulnerability review and operational ownership.

## Start here
1. Read `README.md` for a short overview.
2. Read `docs/ARCHITECTURE-AND-DATA-FLOW.md` to understand the design.
3. Read `docs/DEVELOPER-CONTINUATION-GUIDE.md` before changing code.
4. Run `1-SELF-TEST.cmd` and `7-FULL-AUDIT.cmd` after any code change.
5. Use `docs/BANK-UAT-RUNBOOK.md` for real bank testing.
6. Use `HANDOVER-CHECKLIST.md` before transferring ownership.

## Non-negotiable architecture rules
- ReportServer is **read-only** from this application.
- No Power BI REST API is required by this build.
- The browser never connects directly to SQL.
- The local LLM is **not** the source of monitoring facts; governed Python tools are authoritative.
- Do not display a KPI value unless its source is verified.
- Do not expose SQL hostnames, local filesystem paths, credentials, App Passwords, or raw stack traces in the executive browser.
- Demo data must never be mixed with real UAT/production data.

## Canonical documentation
For a single shareable document, use `Demo_Bank_BI_Monitoring_Handover_Manual_v2.1.0.pdf` (or the editable DOCX).
See `docs/DOCUMENTATION-INDEX.md` for the complete documentation map.

## Primary handover documentation
Start with **`Demo_Bank_BI_Monitoring_Handover_Manual_v2.1.0.pdf`** for the complete 28-page technical handover, operations, UAT, security, Copilot, email, troubleshooting and developer-continuation manual. The editable DOCX version is included beside it.

The text reference is `docs/COMPLETE-SYSTEM-DOCUMENTATION.md`; specialist documents under `docs/` remain the detailed supporting references.
