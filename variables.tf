variable "ssh_key_public" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the SSH public key for accessing cloud instances. Used for creating AWS keypair."
}

variable "ssh_key_private" {
  default     = "~/.ssh/id_rsa"
  description = "Path to the SSH public key for accessing cloud instances. Used for creating AWS keypair."
}

variable "server_vpc_ip" {
  default = "10.10.10.0/24"
}

variable "server_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443, 5432]
}

variable "ebs_iops" {
  type        = number
  default     = 100
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
}