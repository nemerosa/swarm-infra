variable "swarm_ip" {
   description = "IP or DNS entry of the swarm"
}

variable "swarm_ssh_user" {
   description = "User for the SSH connection to the swarm"
}

variable "swarm_ssh_key_private" {
   description = "Path to private key for the SSH connection to the swarm"
}

variable "stack_name" {
   description = "Name of the stack"
}

variable "stack_compose_file" {
   description = "Path to the local Compose file which defines the stack"
}

variable "stack_remote_dir" {
   description = "Path to the remote directory where to store the stack compose files"
   default = "/stacks"
}

variable "stack_environment" {
   description = "List of environment variables: NAME=VALUE"
   default = []
}
