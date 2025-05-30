# Project-Alpha


#Deploy To Subscription scope using Azure CLI
az deployment sub create --name <name> --location <location> --template-file <path-to-bicep>
ex. az deployment sub create --name mks-deployment --location westus2 --template-file main.bicep

#Delete Deployment at Subscriptions scope using Azure CLI
az deployment sub delete --name  <deployment_name> --no-wait
ex. az deployment sub delete -n mks-deployment --no-wait