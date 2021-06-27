# Uncomment to create a AMI when promtail installed

resource "aws_ami_from_instance" "AMI-promtail" {
  name = var.new_ami_name
  source_instance_id = aws_instance.AMI-master-promtail.id

  depends_on = [
    null_resource.setup-packages,
  ]
}

output "AMI_ID" {
  value = aws_ami_from_instance.AMI-promtail.id
}

output "AMI_Name" {
  value = aws_ami_from_instance.AMI-promtail.name
}