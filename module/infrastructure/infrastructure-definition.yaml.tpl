infrastructureDefinition:
  name: ${infrastructureName}
  identifier: ${infrastructureIdentifier}
  description: ""
  tags: {}
  orgIdentifier: ${orgIdentifier}
  environmentRef: ${envIdentifier}
  deploymentType: ${deploymentType}
  type: ${type}
  spec:
    connectorRef: ${connectorRef}
    namespace: ${namespace}
    releaseName: release-<+INFRA_KEY>
    allowSimultaneousDeployments: ${allow_simultaneous_deployments}
