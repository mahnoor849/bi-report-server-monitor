# Simple Presentation Guide - v2.1.0

## One-line explanation
This system monitors Power BI Report Server through read-only SQL metadata, shows verified report health/KPIs in one executive command center, creates incidents for operational failures, can notify the team, and uses a local Qwen Copilot to explain current monitoring evidence.

## Data flow
`ReportServer SQL -> Python monitoring engine -> governed KPIs/incidents -> executive dashboard + local Copilot`

## Important presentation statements
- No Power BI REST API is required.
- ReportServer is read only.
- The browser does not connect directly to SQL.
- If a value cannot be verified, the dashboard shows N/A/Unknown instead of inventing a number.
- The Copilot explains governed monitoring facts; it is not the authority for KPIs.
- Demo mode uses synthetic data and must be labelled DEMO DATA.

## Demo sequence
Executive Overview -> Simulate Failure -> Ask Copilot -> Incidents -> Simulate Recovery -> Ask Copilot -> Wallboard.

## Production boundary
Today's UAT/demo proves application behavior. Production still requires bank SQL reconciliation, approved hosting/mail/authentication and operational sign-off.
