using './main.bicep'

// General Parameters
param parLocations = [
  'australiaeast'
  'australiasoutheast'
]
param parEnableTelemetry = true

param landingZonesConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'landingzones'
  managementGroupParentId: 'alz'
  managementGroupIntermediateRootName: 'alz'
  managementGroupDisplayName: 'Landing zones'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Enable-DDoS-VNET': {
    parameters: {
      ddosPlan: {
        value: '/subscriptions/3b2700dc-4d2b-497c-9d99-b7b690424e07/resourceGroups/rg-alz-conn-${parLocations[0]}/providers/Microsoft.Network/ddosProtectionPlans/ddos-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
      logAnalyticsWorkspaceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
      userWorkspaceResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
      dcrResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-mdfcsql-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/10697434-6ff6-43b1-9551-924136ca363f/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
}
