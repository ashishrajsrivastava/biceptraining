
# Check if the vm exists
$vm = Get-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM" -ErrorAction SilentlyContinue
if ($vm) {
    # Delete the vm
    Write-Host "VM exists. Deleting the VM"
    Remove-AzResourceGroup -Name "myResourceGroup" -Force
}
else {
    Write-Host "VM does not exist"
}
$vmAdminUsername = "adminuser"
$vmAdminPassword = ConvertTo-SecureString "LocalAdminP@sswordHere" -AsPlainText -Force
$vmAdminCred = New-Object System.Management.Automation.PSCredential ($vmAdminUsername, $vmAdminPassword)


# Create the vm
New-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM" -Location "EastUS" -Image "Win2012R2Datacenter" -Size "Standard_D2s_v3" -Credential $vmAdminCred -OpenPorts 80,3389


