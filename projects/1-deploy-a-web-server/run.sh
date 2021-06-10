echo 'Creating Resource Group';
az group create --location uksouth --resource-group udacity-project-1;

echo "\n----------------------------------------------------------\n";
echo 'Finished creating resource group';
echo "\n----------------------------------------------------------\n";

echo 'Creating Azure Policy definition';
az policy definition create \
--name tagging-policy \
--rules policy.rules.json \
--mode indexed \
--display-name "Deny the creation of a resource that does not have tags";

echo "\n----------------------------------------------------------\n";
echo "Finished creating Policy Definition";
echo "\n----------------------------------------------------------\n";

echo "Assigning Policy Defition";
az policy assignment create --policy tagging-policy;


echo "\n----------------------------------------------------------\n";
echo "Finished assigning Policy";
echo "\n----------------------------------------------------------\n";

echo '\n\nSource .env';
source .env;

echo "\n----------------------------------------------------------\n";
echo 'Finished sourcing environment variables';
echo "\n----------------------------------------------------------\n";

echo "\n\nBuilding Packer Image";
packer build server.json;


echo "\n----------------------------------------------------------\n";
echo "Finished building Packer Image";
echo "\n----------------------------------------------------------\n";

echo "\n\nImporting Resource Group into Terraform State";
terraform import azurerm_resource_group.main "/subscriptions/$TF_VAR_subscription_id/resourceGroups/udacity-project-1";


echo "\n----------------------------------------------------------\n";
echo "Finished Importing Resource Group into Terraform State";
echo "\n----------------------------------------------------------\n";

echo "\n\nPlanning Terraform Deployment";
terraform plan -out solution.plan;


echo "\n----------------------------------------------------------\n";
echo "Finished Planning";
echo "\n----------------------------------------------------------\n";

echo "Deploying Infrastructure using Terraform";
terraform apply "solution.plan";

echo "\n----------------------------------------------------------\n";
echo "Finished Deploying Infrastructure";
echo "\n----------------------------------------------------------\n";