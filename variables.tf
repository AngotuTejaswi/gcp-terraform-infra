variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "Name of the VM"
  type        = string
  default     = "harness-deployed-vm"
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}
