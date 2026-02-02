$report = @()

Import-Csv "..\data\person_registry.csv" |
ForEach-Object {
    if ($_.role -eq "Staff" -and $_.department -eq "IT") {
        $report += [PSCustomObject]@{
            User       = "$($_.firstName) $($_.lastName)"
            Role       = $_.role
            Department = $_.department
            RiskLevel  = "High"
        }
    }
}

$report | Export-Csv "..\data\access_review_report.csv" -NoTypeInformation
Write-Output "Access review report generated."
