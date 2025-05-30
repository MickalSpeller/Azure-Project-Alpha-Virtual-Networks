# Project-Alpha

The purpose of this project, Project-Alpha is to document my run-throughs and review of some core Azure services deployments/configurations using Azure CLI and Bicpe.

My goal is to just demonstrate basic level configurations and resources I used to deploy Azure resources using Bicep. This is useful for my personal education/practice and can also benefit those who are early on in their Azure/Bicep knowledge seeking endeavors.

The following is a list of Azure network realated services I will be focusing on for this project:

        * Virtual Networks
        * Azure DNS
        * Express Routes
        * Virtual WAN
        * Network Watcher
        * Hub-Spoke Topology
        * Firewall
        * Load Balancer
        * NAT Gateway
        * Private Link
        * Virtual Network Peering
        * Local Network Gateways
        * Virtual Network Gateway
        * Web Application Firewall
        * Virtual Network Service Endpoint


Useful Azure CLI Commands:

#Deploy To Subscription scope using Azure CLI
az deployment sub create --name <name> --location <location> --template-file <path-to-bicep>
ex. az deployment sub create --name mks-deployment --location westus2 --template-file main.bicep

#Delete Deployment at Subscriptions scope using Azure CLI
az deployment sub delete --name  <deployment_name> --no-wait
ex. az deployment sub delete -n mks-deployment --no-wait
