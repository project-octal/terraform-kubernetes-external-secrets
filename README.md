# terraform-kubernetes-external-secrets
Simplifies the deployment and management of the Kubernetes External Secrets operator on a Kubernetes cluster.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_cluster_role_binding.cluster_role_binding_secrets_auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_config_map.deployment_env_configmap](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.deployment_env_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.prometheus_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service_account.service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additional namespace annotations (e.g. for `linkerd.io/inject: enabled` for mesh things) | `map(string)` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | An instance name used for the resources deployed by this module. | `string` | `"external-secrets-vault"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image to use when deploying Kubernetes-External-Secrets | `string` | `"external-secrets/kubernetes-external-secrets"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. \| `IfNotPresent`: Only pull the image if it does not already exist on the node. \| `Never`: Never pull the image | `string` | `"Always"` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | The image repository to use when pulling images | `string` | `"ghcr.io"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The version of Kubernetes-External-Secrets to deploy | `string` | `"8.5.1"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map that consists of any additional labels that should be included with resources created by this module. | `map(string)` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (optional) The name given to the namespace in which Traefik will reside. | `string` | `"kube-external-secrets"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | The number of replicas the deployments replicaset should maintain | `number` | `2` | no |
| <a name="input_resource_limits"></a> [resource\_limits](#input\_resource\_limits) | Resource limits for the deployment pods | <pre>object({<br>    cpu    = string,<br>    memory = string<br>  })</pre> | <pre>{<br>  "cpu": "200m",<br>  "memory": "256Mi"<br>}</pre> | no |
| <a name="input_resource_requests"></a> [resource\_requests](#input\_resource\_requests) | Resource requests for the deployment pods | <pre>object({<br>    cpu    = string,<br>    memory = string<br>  })</pre> | <pre>{<br>  "cpu": "100m",<br>  "memory": "128Mi"<br>}</pre> | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | The address of the Vault instance accessed by this instance | `string` | n/a | yes |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | The token used by this instance to access Vault | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->