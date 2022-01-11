variable "deployment_name" {
  type        = string
  description = "An instance name used for the resources deployed by this module."
  default     = "external-secrets-vault"
}
variable "namespace" {
  type        = string
  description = "(optional) The name given to the namespace in which Traefik will reside."
  default     = "kube-external-secrets"
}
variable "annotations" {
  type        = map(string)
  description = "Additional namespace annotations (e.g. for `linkerd.io/inject: enabled` for mesh things)"
  default     = {}
}
variable "image_tag" {
  type        = string
  description = "The version of Kubernetes-External-Secrets to deploy"
  default     = "8.5.1"
}
variable "image_name" {
  type        = string
  description = "The image to use when deploying Kubernetes-External-Secrets"
  default     = "external-secrets/kubernetes-external-secrets"
}
variable "image_repository" {
  type        = string
  description = "The image repository to use when pulling images"
  default     = "ghcr.io"
}
variable "image_pull_policy" {
  type        = string
  description = "Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. | `IfNotPresent`: Only pull the image if it does not already exist on the node. | `Never`: Never pull the image"
  default     = "Always"
}
variable "labels" {
  type        = map(string)
  description = "A map that consists of any additional labels that should be included with resources created by this module."
  default     = {}
}
variable "replicas" {
  type        = number
  description = "The number of replicas the deployments replicaset should maintain"
  default     = 1
}

variable "resource_requests" {
  type = object({
    cpu    = string,
    memory = string
  })
  description = "Resource requests for the deployment pods"
  default = {
    cpu    = "100m"
    memory = "128Mi"
  }
}

variable "resource_limits" {
  type = object({
    cpu    = string,
    memory = string
  })
  description = "Resource limits for the deployment pods"
  default = {
    cpu    = "200m"
    memory = "256Mi"
  }
}

variable "vault_address" {
  type        = string
  description = "The address of the Vault instance accessed by this instance"
}