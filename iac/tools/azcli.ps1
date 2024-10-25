

az vm create -n MyVm -g MyResourceGroup --public-ip-address "" --image Win2022Datacenter --admin-username azureuser --admin-password Password1234! --authentication-type password --size Standard_DS2_v2 --location eastus