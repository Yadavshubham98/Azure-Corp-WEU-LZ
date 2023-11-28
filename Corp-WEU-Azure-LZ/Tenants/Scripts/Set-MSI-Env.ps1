#Set environmental variables for Azure Managed Identity

$env:ARM_USE_MSI="true"
$env:ARM_TENANT_ID="bdef8a20-aaac-4f80-b3a0-d9a32f99fd33" #replace with you tenant id
$env:ARM_SUBSCRIPTION_ID="13b43927-ae7e-47ce-9a4a-85da205ba210" #replace with any subscription id that the managed identity has access to deploy resources







