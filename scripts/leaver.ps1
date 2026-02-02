Import-Csv "..\data\person_registry.csv" |
Where-Object { $_.status -eq "Terminated" } |
ForEach-Object {

    $username = ($_.firstName.Substring(0,1) + $_.lastName).ToLower()

    Write-Output "Deprovisioning user: $username"
    Write-Output "Disabling AD account"
    Write-Output "Removing all group memberships"
    Write-Output "Archiving user record"
    Write-Output "---------------------------------------"
}