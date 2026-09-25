# Azure Cloud Endpoint Security & SOC Automation Platform

Enterprise-style Azure lab demonstrating endpoint management, identity security, centralized logging, threat detection, alerting and controlled SOC automation.

## Stack
- Terraform / AzureRM
- Microsoft Entra ID
- Azure VNet, NSG, Windows VM
- Log Analytics Workspace
- Microsoft Defender for Cloud
- Microsoft Sentinel
- Azure Monitor / Action Groups
- Microsoft Intune / Endpoint management (tenant-side configuration documented in runbooks)
- Logic Apps automation template
- Key Vault and Storage
- GitHub Actions

## Terraform workflow
```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

> Review the plan before apply. Some Defender, Sentinel and Intune capabilities depend on tenant licensing/permissions and are documented as configuration steps rather than pretending they are fully deployable by AzureRM alone.

## Project outcomes
1. Secure Azure landing zone for endpoint/SOC lab.
2. Centralized Windows telemetry in Log Analytics.
3. Defender for Cloud and Sentinel foundations.
4. Sentinel analytics rule for suspicious Windows activity.
5. Action group notifications.
6. Logic App automation scaffold for incident response.
7. Intune/Entra configuration runbooks and screenshot checklist.
