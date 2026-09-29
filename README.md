# Demo Bank BI Monitoring Command Center v2.1.0

Handover-ready UAT/presentation build for the AI & Data Science team.

## What the system does
- Reads Power BI Report Server SQL metadata in **read-only** mode.
- Maintains a complete report inventory using the report catalog.
- Classifies lifecycle: `Active`, `Inactive`, `Under Work`, `Retired`.
- Classifies technical health: `Healthy`, `Running`, `Failed`, `Overdue`, `Hung`, `Unknown`.
- Reconstructs refresh runs from execution-log evidence.
- Calculates governed KPIs and hides unverified values as `N/A`.
- Opens/resolves monitoring incidents and maintains an alert outbox with retry.
- Provides an executive dashboard and wallboard view.
- Provides a local Monitoring Copilot using Ollama + `qwen2.5:3b` over governed monitoring tools.
- Supports a controlled one-real-UAT-email workflow for routing validation.

## What it does not do
- It does not write to the Microsoft ReportServer database.
- It does not use the Power BI REST API.
- It does not send monitoring data to an external LLM API.
- It does not contain a hard-coded free-form chatbot answer map.
- It is not yet production-go-live certified.

## Fast local demo
```powershell
Get-ChildItem . -Recurse | Unblock-File
.\8-CHECK-OLLAMA-QWEN.cmd
.\9-PRESENTATION-READINESS-CHECK.cmd
.\0-RUN-LOCAL-DEMO.cmd
```
Default demo URL: `http://127.0.0.1:8091`

## Bank UAT
Use:
```powershell
.\0-RUN-BANK-UAT-WIZARD.cmd
```
The confidential SQL Server/instance is requested through hidden runtime input and is not included in the distributed package.

## Documentation
Start with `00-HANDOVER-README.md` and then `docs/DOCUMENTATION-INDEX.md`.

## Production warning
Before production, complete the gates in `docs/PRODUCTION-READINESS-GATES.md`. The UAT Gmail sender, local laptop hosting, local SQLite store, and localhost-only access are **not** the final production operating model.

## Complete handover manual
The canonical human-readable handover is `Demo_Bank_BI_Monitoring_Handover_Manual_v2.1.0.pdf` (editable DOCX also included). It covers architecture, configuration, SQL integration, KPI logic, status rules, incident/email workflow, Ollama/Qwen Copilot, UI screens, security, UAT, troubleshooting, production gates and developer continuation.
