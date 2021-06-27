# Execute commands on remote instance (Add connection to remote-exec)

resource "null_resource" "setup-packages" {
    # triggers = {
    #     always_run = timestamp()
    # }

    provisioner "file" {
        source = var.script_name
        destination = "/tmp/script.sh"

        connection {
          type = "ssh"
          user = "ec2-user"
          host = aws_instance.AMI-master-promtail.public_ip
          private_key = file(var.private_key_file)
        }
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "dos2unix /tmp/script.sh",
            "/tmp/script.sh ${promtail_location}",
            "rm /tmp/script.sh"
        ]

        connection {
          type = "ssh"
          user = "ec2-user"
          host = aws_instance.AMI-master-promtail.public_ip
          private_key = file(var.private_key_file)
        }    
    }

    depends_on = [
        aws_instance.ustockdev-gen2-reactor-AMI-master-promtail,
    ]
}