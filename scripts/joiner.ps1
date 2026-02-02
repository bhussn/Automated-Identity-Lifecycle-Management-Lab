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
  
# RBAC mapping and user provisioning simulation
Import-Csv "..\data\person_registry.csv" |
Where-Object { $_.status -eq "Active" } |
ForEach-Object {

    $username = ($_.firstName.Substring(0,1) + $_.lastName).ToLower()

    Write-Output "Provisioning user: $username"
    Write-Output "Creating AD account for $username"

    if ($RoleGroups.ContainsKey($_.role)) {
        foreach ($group in $RoleGroups[$_.role]) {
            Write-Output "Adding $username to group: $group"
        }
    } else {
        Write-Warning "No RBAC rules defined for role: $($_.role)"
    }

    Write-Output "Provisioning complete for $username"
    Write-Output "---------------------------------------"
}
