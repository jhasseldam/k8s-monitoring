# Import all JSON files in folder
$JSONFiles = Get-ChildItem -Name -File -Filter '*.json' -Path ".\dashboards"

Write-Output "Converting the following ConfigMaps:"

foreach ($File in $JSONFiles) {
    $DASHBOARD_NAME = ($File -replace "-[0-9]{13}", "" -replace ".json", "").ToLower()

    # Generate configmap, indenting JSON 4 spaces
    (Get-Content .\templates\template-dashboard-cm.yaml) -replace "DASHBOARD_NAME", $DASHBOARD_NAME | Out-File .\configmaps\$($DASHBOARD_NAME)-cm.yaml
    '    ' + (Get-Content .\dashboards\$($File) -Raw) -replace "`n", "`n    " | Out-File .\configmaps\$($DASHBOARD_NAME)-cm.yaml -Append

}

Get-ChildItem -Name -Path ".\configmaps"