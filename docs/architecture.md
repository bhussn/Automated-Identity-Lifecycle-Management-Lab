# Architecture Overview

## Identity Source
The system uses a CSV-based Person Registry as the authoritative source of identity data. This simulates HR and Student Information System (SIS) feeds commonly consumed by enterprise IAM platforms such as SailPoint.

## IAM Logic Layer
PowerShell scripts process identity lifecycle events:
- Joiner (provisioning)
- Mover (role or department change)
- Leaver (deprovisioning)
- Access review (governance)

Role-Based Access Control (RBAC) rules determine group entitlements based on user role.

## Target Systems (Simulated)
- Active Directory (account lifecycle)
- Entra ID / Azure AD (group-based access)
- Email and application access via group membership

All provisioning actions are simulated to reflect real-world IAM workflows without requiring production access.

## SailPoint Equivalence
- Identity Source → HR/SIS feed
- RBAC Mapping → Entitlement catalog
- Joiner/Mover/Leaver scripts → Lifecycle Manager
- Access Review → Identity Governance & Administration (IGA)
