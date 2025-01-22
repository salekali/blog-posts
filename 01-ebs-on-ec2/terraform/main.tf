provider "aws" {
  region = var.region
}

resource "aws_ebs_volume" "datavolume" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type              = "gp3"

  tags = { Name = "Data-Volume" }
}

resource "aws_volume_attachment" "datavolume_attach" {
  device_name = "/dev/xvdbf"
  volume_id   = aws_ebs_volume.datavolume.id
  instance_id = var.instance_id
}
