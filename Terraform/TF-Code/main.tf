# trigger:
#   - main

# pool:
#   name: docai-agent-pool

# variables:
#   backendServiceArm: 'synapse_manual_spn_rg-llmstudio-test'
#   backendAzureRmResourceGroupName: 'rg-doc-ai-studio-dev-01'
#   backendAzureRmStorageAccountName: 'sadocaistudio01'
#   backendAzureRmContainerName: 'tfstate'
#   backendAzureRmKey: 'dev'


# stages:

# # Stage 1: Terraform Init & Plan (No Approval)
# - stage: TerraformPlan
#   displayName: "Terraform Init and Plan"
#   jobs:
#   - job: Plan
#     steps:
#     - task: TerraformInstaller@1
#       displayName: Terraform installation
#       inputs:
#         terraformVersion: 'latest'
    

#     - task: TerraformTask@5
#       displayName: Terraform Init
#       inputs:
#         provider: 'azurerm'
#         command: 'init'
#         workingDirectory: '$(System.DefaultWorkingDirectory)'
#         backendServiceArm: '$(backendServiceArm)'
#         backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
#         backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
#         backendAzureRmContainerName: '$(backendAzureRmContainerName)'
#         backendAzureRmKey: '$(backendAzureRmKey)'
  
#     - task: TerraformTask@5
#       displayName: Terraform Plan
#       inputs:
#         provider: 'azurerm'
#         command: 'plan'
#         environmentServiceNameAzureRM: '$(backendServiceArm)'
#         workingDirectory: '$(System.DefaultWorkingDirectory)'
#         commandOptions: '-target=module.service_connection -var-file=terraform.tfvars -input=false'
    
#     - task: AzureCLI@2
#       displayName: 'Azure CLI Auth Context for Terraform local-exec'
#       inputs:
#         azureSubscription: '$(backendServiceArm)'  # This sets up az login automatically
#         scriptType: 'bash'
#         scriptLocation: 'inlineScript'
#         inlineScript:
#           echo "✅ Azure CLI is authenticated"
#          'az account show'
    
  
#     # - task: TerraformTask@5
#     #   inputs:
#     #     provider: 'azurerm'
#     #     command: 'apply'
#     #     environmentServiceNameAzureRM: 'synapse_manual_spn_rg-llmstudio-test'
#     #     workingDirectory: '$(System.DefaultWorkingDirectory)'
#     #     commandOptions: '-target=module.cosmosdb_mongo -var-file=terraform.tfvars -input=false'

# # Stage 2: Terraform Apply (With Approval)
# - stage: TerraformApply
#   displayName: "Terraform Apply"
#   dependsOn: TerraformPlan
#   condition: succeeded()
#   jobs:
#   - deployment: ApplyJob
#     environment: Terraform-Approval  
#     strategy:
#       runOnce:
#         deploy:
#           steps:
#           - task: TerraformInstaller@1
#             displayName: Terraform installation
#             inputs:
#               terraformVersion: 'latest'

#           - task: TerraformTask@5
#             displayName: Terraform Init
#             inputs:
#               provider: 'azurerm'
#               command: 'init'
#               workingDirectory: '$(System.DefaultWorkingDirectory)'
#               backendServiceArm: '$(backendServiceArm)'
#               backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
#               backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
#               backendAzureRmContainerName: '$(backendAzureRmContainerName)'
#               backendAzureRmKey: '$(backendAzureRmKey)'
          
#           - task: AzureCLI@2
#             displayName: 'Azure CLI Auth Context for Terraform local-exec'
#             inputs:
#               azureSubscription: '$(backendServiceArm)'  # This sets up az login automatically
#               scriptType: 'bash'
#               scriptLocation: 'inlineScript'
#               inlineScript:
#                 echo "✅ Azure CLI is authenticated"
#                'az account show'
          
#           - task: TerraformTask@5
#             displayName: Terraform Apply
#             inputs:
#               provider: 'azurerm'
#               command: 'apply'
#               environmentServiceNameAzureRM: '$(backendServiceArm)'
#               workingDirectory: '$(System.DefaultWorkingDirectory)'
#               commandOptions: '-target=module.service_connection -var-file=terraform.tfvars -input=false'


# trigger:
#   - main

# pool:
#   name: docai-agent-pool

# variables:
#   backendServiceArm: 'synapse_manual_spn_rg-llmstudio-test'
#   backendAzureRmResourceGroupName: 'rg-doc-ai-studio-dev-01'
#   backendAzureRmStorageAccountName: 'sadocaistudio01'
#   backendAzureRmContainerName: 'tfstate'
#   backendAzureRmKey: 'dev'
#   # Add the correct subscription ID as a variable
#   azureSubscriptionId: '94125ed2-b170-486b-a07a-0006d2d979a9'

# stages:
# # Stage 1: Terraform Init & Plan (No Approval)
# - stage: TerraformPlan
#   displayName: "Terraform Init and Plan"
#   jobs:
#   - job: Plan
#     steps:
#     - task: TerraformInstaller@1
#       displayName: Terraform installation
#       inputs:
#         terraformVersion: 'latest'
    
#     - task: TerraformTask@5
#       displayName: Terraform Init
#       inputs:
#         provider: 'azurerm'
#         command: 'init'
#         workingDirectory: '$(System.DefaultWorkingDirectory)'
#         backendServiceArm: '$(backendServiceArm)'
#         backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
#         backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
#         backendAzureRmContainerName: '$(backendAzureRmContainerName)'
#         backendAzureRmKey: '$(backendAzureRmKey)'
    
#     - task: AzureCLI@2
#       displayName: 'Azure CLI Auth Context for Terraform Plan'
#       inputs:
#         azureSubscription: '$(backendServiceArm)'
#         scriptType: 'bash'
#         scriptLocation: 'inlineScript'
#         inlineScript: |
#           echo "✅ Azure CLI is authenticated"
          
#           # Explicitly set to the correct subscription immediately
#           echo "Setting subscription to: $(azureSubscriptionId)"
#           az account set --subscription "$(azureSubscriptionId)"
          
#           echo "Using subscription:"
#           az account show
          
#           # Check Network permissions for the service principal
#           echo "Checking Service Principal Permissions..."
#           SP_ID=$(az account show --query user.name --output tsv)
#           echo "Service Principal ID: $SP_ID"
          
#           # List role assignments to diagnose permission issues
#           echo "Current role assignments in AKS-managed resource group:"
#           az role assignment list --scope "/subscriptions/$(azureSubscriptionId)/resourceGroups/MC_rg-doc-ai-studio-dev-01_aks-docaistudio-hc_eastus" --query "[].{principalName:principalName, roleDefinitionName:roleDefinitionName}" --output table || echo "Cannot list roles - may need additional permissions"
          
#           # Run Terraform Plan within the authenticated context
#           terraform plan -target=module.service_connection -var-file=terraform.tfvars -input=false

# # Stage 2: Terraform Apply (With Approval)
# - stage: TerraformApply
#   displayName: "Terraform Apply"
#   dependsOn: TerraformPlan
#   condition: succeeded()
#   jobs:
#   - deployment: ApplyJob
#     environment: Terraform-Approval  
#     strategy:
#       runOnce:
#         deploy:
#           steps:
#           - task: TerraformInstaller@1
#             displayName: Terraform installation
#             inputs:
#               terraformVersion: 'latest'

#           - task: TerraformTask@5
#             displayName: Terraform Init
#             inputs:
#               provider: 'azurerm'
#               command: 'init'
#               workingDirectory: '$(System.DefaultWorkingDirectory)'
#               backendServiceArm: '$(backendServiceArm)'
#               backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
#               backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
#               backendAzureRmContainerName: '$(backendAzureRmContainerName)'
#               backendAzureRmKey: '$(backendAzureRmKey)'
          
#           - task: AzureCLI@2
#             displayName: 'Azure CLI Auth Context for Terraform Apply'
#             inputs:
#               azureSubscription: '$(backendServiceArm)'
#               scriptType: 'bash'
#               scriptLocation: 'inlineScript'
#               inlineScript: |
#                 echo "✅ Azure CLI is authenticated"
                
#                 # Explicitly set to the correct subscription immediately
#                 echo "Setting subscription to: $(azureSubscriptionId)"
#                 az account set --subscription "$(azureSubscriptionId)"
                
#                 echo "Using subscription:"
#                 az account show
                
#                 # Check Network permissions for the service principal
#                 echo "Checking Service Principal Permissions..."
#                 SP_ID=$(az account show --query user.name --output tsv)
#                 echo "Service Principal ID: $SP_ID"
                
#                 # Try to assign Network Contributor role if we have permissions
#                 echo "Attempting to add Network Contributor role to the Service Principal..."
#                 MC_RG="MC_rg-doc-ai-studio-dev-01_aks-docaistudio-hc_eastus"
                
#                 az role assignment create \
#                   --assignee "$SP_ID" \
#                   --role "Network Contributor" \
#                   --scope "/subscriptions/$(azureSubscriptionId)/resourceGroups/$MC_RG" || echo "Could not assign Network Contributor role. You may need to do this manually in the Azure Portal."
                
#                 # Run Terraform Apply within the authenticated context
#                 terraform apply -auto-approve -target=module.service_connection -var-file=terraform.tfvars -input=false



trigger:
  - main

pool:
  name: docai-agent-pool  #LLM-agent-pool

variables:
  backendServiceArm: 'synapse_manual_spn_rg-llmstudio-test'
  backendAzureRmResourceGroupName: 'rg-doc-ai-studio-dev-01'
  backendAzureRmStorageAccountName: 'sadocaistudio01'
  backendAzureRmContainerName: 'tfstate'
  backendAzureRmKey: 'dev'
  azureSubscriptionId: '94125ed2-b170-486b-a07a-0006d2d979a9'

stages:
# Stage 1: Terraform Init & Plan
- stage: TerraformPlan
  displayName: "Terraform Init and Plan"
  jobs:
  - job: Plan
    steps:
    - task: TerraformInstaller@1
      displayName: Terraform installation
      inputs:
        terraformVersion: 'latest'
    
    - task: TerraformTask@5
      displayName: Terraform Init
      inputs:
        provider: 'azurerm'
        command: 'init'
        workingDirectory: '$(System.DefaultWorkingDirectory)'
        backendServiceArm: '$(backendServiceArm)'
        backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
        backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
        backendAzureRmContainerName: '$(backendAzureRmContainerName)'
        backendAzureRmKey: '$(backendAzureRmKey)'
    
    - task: AzureCLI@2
      displayName: 'Terraform Plan'
      inputs:
        azureSubscription: '$(backendServiceArm)'
        scriptType: 'bash' #ps'
        scriptLocation: 'inlineScript'
        inlineScript: |
          # Set subscription
          az account set --subscription "$(azureSubscriptionId)"
          
          # Run Terraform Plan
          terraform plan -target=module.redis_instances -var-file=terraform.tfvars -input=false

# Stage 2: Terraform Apply (With Approval)
- stage: TerraformApply
  displayName: "Terraform Apply"
  dependsOn: TerraformPlan
  condition: succeeded()
  jobs:
  - deployment: ApplyJob
    environment: Terraform-Approval  
    strategy:
      runOnce:
        deploy:
          steps:
          - task: TerraformInstaller@1
            displayName: Terraform installation
            inputs:
              terraformVersion: 'latest'

          - task: TerraformTask@5
            displayName: Terraform Init
            inputs:
              provider: 'azurerm'
              command: 'init'
              workingDirectory: '$(System.DefaultWorkingDirectory)'
              backendServiceArm: '$(backendServiceArm)'
              backendAzureRmResourceGroupName: '$(backendAzureRmResourceGroupName)'
              backendAzureRmStorageAccountName: '$(backendAzureRmStorageAccountName)'
              backendAzureRmContainerName: '$(backendAzureRmContainerName)'
              backendAzureRmKey: '$(backendAzureRmKey)'
          
          # - task: AzureCLI@2 echo
          #   displayName: 'Install Service Connector Extension'
          #   timeoutInMinutes: 10
          #   inputs:
          #     azureSubscription: '$(backendServiceArm)'
          #     scriptType: 'bash'
          #     scriptLocation: 'inlineScript'
          #     inlineScript: |
          #       # Set subscription
          #       az account set --subscription "$(azureSubscriptionId)"
                
          #       # Install k8s-extension CLI extension
          #       echo "Installing k8s-extension CLI extension..."
          #       az extension add --name k8s-extension --only-show-errors
                
          #       # Install Service Connector extension
          #       echo "Installing Service Connector extension..."
                
          #       # Check if extension already exists
          #       if az k8s-extension show --name sc-extension --cluster-type managedClusters --cluster-name aks-docaistudio-hc --resource-group rg-doc-ai-studio-dev-01 &>/dev/null; then
          #         echo "Service Connector extension already exists."
                  
          #         # Get the status
          #         EXTENSION_STATUS=$(az k8s-extension show --name sc-extension --cluster-type managedClusters --cluster-name aks-docaistudio-hc --resource-group rg-doc-ai-studio-dev-01 --query "provisioningState" -o tsv)
          #         echo "Current status: $EXTENSION_STATUS"
          #       else
          #         # Create the extension
          #         echo "Creating extension..."
          #         az k8s-extension create \
          #           --name sc-extension \
          #           --extension-type Microsoft.ServiceConnector \
          #           --cluster-type managedClusters \
          #           --cluster-name "aks-docaistudio-hc" \
          #           --resource-group "rg-doc-ai-studio-dev-01" \
          #           --auto-upgrade true
                    
          #         # Wait for extension initialization
          #         echo "Waiting for extension initialization (2 minutes)..."
          #         sleep 120
                  
          #         # Check status after creation
          #         EXTENSION_STATUS=$(az k8s-extension show --name sc-extension --cluster-type managedClusters --cluster-name aks-docaistudio-hc --resource-group rg-doc-ai-studio-dev-01 --query "provisioningState" -o tsv 2>/dev/null || echo "NOT_FOUND")
          #         echo "Extension status after creation: $EXTENSION_STATUS"
          #       fi
          
          - task: AzureCLI@2
            displayName: 'Apply Redis Module'
            timeoutInMinutes: 20
            inputs:
              azureSubscription: '$(backendServiceArm)'
              scriptType: 'bash' #'ps'
              scriptLocation: 'inlineScript'
              inlineScript: |
                # Set subscription
                az account set --subscription "$(azureSubscriptionId)"
                
                # Apply the terraform module
                echo "apply Redis module..."
                terraform apply -auto-approve -target=module.redis_instances -var-file=terraform.tfvars -input=false
