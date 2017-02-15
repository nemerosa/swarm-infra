##################################################################################################################
# DO Swarm Domain module
##################################################################################################################

module "do_swarm_domain" {
   source = "github.com/nemerosa/do-swarm-domain"
   do_token = "${var.do_token}"
   do_region = "${var.do_region}"
   do_image = "${var.do_image}"
   do_agent_size = "${var.do_agent_size}"
   do_ssh_key_public = "${var.do_ssh_key_public}"
   do_ssh_key_private = "${var.do_ssh_key_private}"
   do_user = "${var.do_user}"
   swarm_name = "${var.swarm_name}"
   swarm_tags = "${var.swarm_tags}"
   swarm_master_count = "${var.swarm_master_count}"
   swarm_agent_count = "${var.swarm_agent_count}"
   dns_domain = "${var.dns_domain}"
   dns_domain_names = "${var.dns_domain_names}"
}
