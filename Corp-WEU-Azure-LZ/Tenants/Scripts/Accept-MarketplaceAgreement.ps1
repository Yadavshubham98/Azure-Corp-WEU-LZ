# Run this script before deploying ZPA servers to accept the Azure Marketplace Agreement programatically
$Publisher = "zscaler"
$Product = "zscaler-private-access"
$Name = "zpa-con-azure"


Get-AzMarketplaceTerms -Publisher $Publisher -Product $Product -Name $Name | Set-AzMarketplaceTerms -Accept
