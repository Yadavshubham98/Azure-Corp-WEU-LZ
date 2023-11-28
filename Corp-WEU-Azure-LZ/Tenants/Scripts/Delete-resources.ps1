#Sample scripts to delete all resources groups with the name "corp". Can be used to delete all terraform deployed resources in a test environment.

Get-AzResourceGroup | ? ResourceGroupName -match "corp-rg-" | Select-Object ResourceGroupName | Remove-AzResourceGroup -AsJob -Force
