resource "null_resource" "swarm_stack" {
   connection {
      host = "${var.swarm_ip}"
      user = "${var.swarm_ssh_user}"
      private_key = "${file(var.swarm_ssh_key_private)}"
      agent = false
   }
   provisioner "remote-exec" {
      inline = [
         "mkdir -p ${var.stack_remote_dir}"
      ]
   }
   provisioner "file" {
      source = "${var.stack_compose_file}"
      destination = "${var.stack_remote_dir}/${var.stack_name}.yml"
   }
   provisioner "remote-exec" {
      inline = [
         "docker stack deploy --compose-file ${var.stack_remote_dir}/${var.stack_name}.yml ${var.stack_name}"
      ]
   }
}
