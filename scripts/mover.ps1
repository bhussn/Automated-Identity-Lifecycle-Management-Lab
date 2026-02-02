# Role-Based Access Control (RBAC)
# Simulates Grouper-managed group assignments

$RoleGroups = @{
    "Student" = @(
        "Students-Apps",
        "Students-LMS",
        "Students-Email"
    )

    "Staff" = @(
        "Staff-Apps",
        "Staff-Email",
        "Staff-VPN"
    )

    "Faculty" = @(
        "Faculty-Apps",
        "Faculty-Email",
        "Faculty-Research"
    )

    "Contractor" = @(
        "Contractor-Limited",
        "Contractor-VPN"
    )

    "IAM-Admin" = @(
        "Privileged-Access",
        "IAM-Admins",
        "MFA-Required"
    )
}

# RBAC mapping and user de-provisioning simulation
Import-Csv "..\data\person_registry.csv" |
ForEach-Object {

    if ($_.role -eq "Staff" -and $_.department -eq "IT") {

        $username = ($_.firstName.Substring(0,1) + $_.lastName).ToLower()

        Write-Output "Mover detected: $username"
        Write-Output "Revoking non-IT staff access"

        Write-Output "Assigning IT-specific access groups"
        Write-Output "Adding $username to group: IT-Staff-Apps"
        Write-Output "---------------------------------------"
    }
}