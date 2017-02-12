## Digital Ocean credentials

variable "do_token" {
  description = "Your DigitalOcean API key"
}

## Digital Ocean settings

variable "do_region" {
  description = "DigitalOcean Region"
  default = "fra1"
}

variable "do_image" {
  # Change to actual image slug when Docker 1.13 available
  description = "Snapshot ID"
  # Specify using:
  # export TF_VAR_do_image=[...]
  default = ""
}

variable "do_agent_size" {
  description = "Agent Droplet Size"
  default = "2GB"
}

variable "do_ssh_key_public" {
  description = "Path to the SSH public key"
  default = "./do-key.pub"
}

variable "do_ssh_key_private" {
  description = "Path to the SSH private key"
  default = "./do-key"
}

variable "do_user" {
  description = "User to use to connect the machine using SSH. Depends on the image being installed."
  default = "root"
}

## Domain

variable "dns_domain" {
  description = "Name of the DNS domain for the swarm"
  default = "nemerosa.net"
}

variable "dns_domain_names" {
  description = "Names to register"
  default = [
    "swarm.ci",
    "jenkins.ci",
    "ontrack.ci",
    "monitoring.ci"
  ]
}

## Swarm setup

variable "swarm_token_dir" {
  description = "Path (on the remote machine) which contains the generated swarm tokens"
  default = "/root"
}

variable "swarm_name" {
  description = "Name of the cluster, used also for networking"
  default = "swarm"
}

variable "swarm_master_count" {
  description = "Number of additional master nodes (at least one is created)."
  default = "0"
}

variable "swarm_agent_count" {
  description = "Number of agents to deploy"
  default = "2"
}
