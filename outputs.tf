# Floating IP
output "swarm_ip" {
  value = "${module.do_swarm_domain.swarm_ip}"
}

# Swarm user
output "swarm_user" {
  value = "${module.do_swarm_domain.swarm_user}"
}
