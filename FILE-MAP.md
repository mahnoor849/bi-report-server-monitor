# File Map - v2.1.0

## Root launchers
| File | Purpose | External effect |
|---|---|---|
| `0-RUN-LOCAL-DEMO.cmd` | Clean synthetic demo on port 8091 | No bank SQL, no email |
| `0-RUN-BANK-UAT-WIZARD.cmd` | Guided real bank UAT | Read-only bank SQL after hidden prompt |
| `1-SELF-TEST.cmd` | Deterministic core regression tests | None |
| `2-CREATE-BANK-CONFIG.cmd` | Create local `config/bank.json` from safe template | Local file only |
| `3-BANK-PREFLIGHT.cmd` | Real SQL preflight using hidden SQL-source loader | Read-only SQL |
| `4-EMAIL-PREFLIGHT.cmd` | SMTP login test | No email sent |
| `5-START-BANK.cmd` | Normal bank UAT runtime | Read-only SQL; mail only if explicitly enabled |
| `6-START-ONE-UAT-EMAIL-TEST.cmd` | Controlled one-real-UAT-email session | One approved UAT mail maximum |
| `7-FULL-AUDIT.cmd` | Full offline package audit | None |
| `8-CHECK-OLLAMA-QWEN.cmd` | Local Ollama/Qwen readiness | Localhost only |
| `9-PRESENTATION-READINESS-CHECK.cmd` | Core + audit + local AI readiness | No bank SQL/email |
| `10-RUN-PRESENTATION-DEMO-WITH-ONE-EMAIL.cmd` | Synthetic demo plus one approved real UAT mail | One UAT mail maximum |
| `11-HANDOVER-AUDIT.cmd` | Documentation/version/package handover audit | None |

## Core folders
- `bank/` - monitoring backend logic.
- `web/` - executive browser UI.
- `config/` - safe templates; local `bank.json` is intentionally not shipped.
- `database/` - read-only bank validation SQL plus future central-store starter.
- `docs/` - canonical handover documentation.
- `scripts/` - PowerShell implementations behind root launchers.
- `tools/` - self-test, audits, preflight and Ollama checker.
- `data/` - runtime-created local monitoring DB; no `.db` ships.
- `models/` - informational only; Ollama manages the model installation in the current design.

## Complete documentation
- `Demo_Bank_BI_Monitoring_Handover_Manual_v2.1.0.pdf` - canonical complete handover manual.
- `Demo_Bank_BI_Monitoring_Handover_Manual_v2.1.0.docx` - editable version.
- `docs/COMPLETE-SYSTEM-DOCUMENTATION.md` - compact text reference aligned with the complete manual.
