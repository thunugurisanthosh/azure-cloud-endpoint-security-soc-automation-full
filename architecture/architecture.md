# Architecture
Internet / Admin
        |
     Entra ID
        |
   Intune / Windows Endpoint
        |
 Defender for Cloud / Defender for Endpoint
        |
   Log Analytics Workspace
        |
 Microsoft Sentinel
     /       \
 Alerts     Incidents
   |           |
 Action Group  Logic App
   |           |
 Email       Controlled Response
