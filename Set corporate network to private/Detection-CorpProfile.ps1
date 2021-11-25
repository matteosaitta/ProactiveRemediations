# Detect if the computer has any network with the company fqdn, trigger remediation if it does ad it's marked as public
# Replace CORP-FQDN with your AD dns FQDN
# 2021 - Matteo Saitta

#Verify
try
{
    $CorpNetStatus = (get-netconnectionprofile -name "CORP-FQDN").networkcategory
    if ($CorpNetStatus -eq "Public") {
        Write-Host "Corporate network profile is set to public"
        exit 1
    }
    else {
        #No remediation required    
        Write-Host "Corporate network profile is set to private"
        exit 0
    }  
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}