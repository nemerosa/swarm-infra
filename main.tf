##################################################################################################################
# Digital Ocean provider
##################################################################################################################

provider "digitalocean" {
  token = "${var.do_token}"
}

##################################################################################################################
# Proxy network
##################################################################################################################

resource "null_resource" "swarm_network_proxy" {
   connection {
      host = "${module.do_swarm_domain.swarm_ip}"
      user = "${var.do_user}"
      private_key = "${file(var.do_ssh_key_private)}"
      agent = false
   }
   provisioner "remote-exec" {
      inline = [
         "docker network create -d overlay proxy"
      ]
   }
}

##################################################################################################################
# Proxy services
##################################################################################################################

module "stack_proxy" {
   source = "./do-swarm-stack"
   swarm_ip = "${module.do_swarm_domain.swarm_ip}"
   swarm_ssh_user = "${var.do_user}"
   swarm_ssh_key_private = "${var.do_ssh_key_private}"
   stack_name = "proxy"
   stack_compose_file = "stack-proxy.yml"
}

##################################################################################################################
# Monitoring services
##################################################################################################################

module "stack_monitoring" {
   source = "./do-swarm-stack"
   swarm_ip = "${module.do_swarm_domain.swarm_ip}"
   swarm_ssh_user = "${var.do_user}"
   swarm_ssh_key_private = "${var.do_ssh_key_private}"
   stack_name = "monitoring"
   stack_compose_file = "stack-monitoring.yml"
   stack_environment = [
      "SWARM_DOMAIN_NAME=swarm.ci.${var.dns_domain}"
   ]
}

##################################################################################################################
# Ontrack services
##################################################################################################################

module "stack_ontrack" {
   source = "./do-swarm-stack"
   swarm_ip = "${module.do_swarm_domain.swarm_ip}"
   swarm_ssh_user = "${var.do_user}"
   swarm_ssh_key_private = "${var.do_ssh_key_private}"
   stack_environment = [
      "ONTRACK_DOMAIN_NAME=ontrack.ci.${var.dns_domain}"
   ]
   stack_name = "ontrack"
   stack_compose_file = "stack-ontrack.yml"
}
