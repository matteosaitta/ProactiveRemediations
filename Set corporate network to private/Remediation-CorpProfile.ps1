# Remediate the corporate network profile to Private
# Replace CORP-FQDN with your AD dns FQDN
# 2021 - Matteo Saitta

# Remediate
try {
    Set-NetConnectionProfile -Name "CORP-FQDN" -NetworkCategory Private
    $CorpNetStatus = (get-netconnectionprofile -name "CORP-FQDN").networkcategory
    
    if ($CorpNetStatus -eq "Private"){
        Write-Host "Network Profile edited successfully"
        exit 0
    }
    else{
        Write-Host "Network Profile unchanged"
        }
}
catch{
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}