data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "demo" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.i_type
  availability_zone      = var.avlb_zn
  key_name               = "key_demo"
  vpc_security_group_ids = [aws_security_group.my_secgp.id]
  #volume_type           = ""
  user_data = local.user_data
  #count = 2


  tags = {
    Name = "${var.tag}_Instance"
  }
}


#### Create a Both Key Public Key and Private Key #####

# resource "tls_private_key" "gen_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }


#### To Attach PublicKey to EC2 Instance #####

# resource "aws_key_pair" "this" {
#   key_name   = "northvir_key"
#   public_key = tls_private_key.gen_key.public_key_openssh
# }

#### To Attach PublicKey to EC2 Instance Crated By Own On Ubuntu ##### 
resource "aws_key_pair" "key" {
  key_name   = "key_demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAd/+XeqMuurPnVNhbn/IkYHdy90NRS/0OXP1VZFDSe6PO/ddc+sJmTzYW0JStI1FcD/F+7hyLbrVNQLs3jvX97vdsLGHCO1A3TepmON4GfHQHXDKx1m1vowezGLZPOB7cMpcToXFgFWWMytdmUB8uJKJFxMLwXRnEAlEfzi4c5Rx4AYsqRilt/QiYQiKk6NMLDQmY6eBhwffN+9W2zSYsV8uUhUbTKIPQRM3YMMkEJJvXXvpEdbIh+EjgH05D947P5gUiD3rVnST4onlcbOb7xyQNiqyyT4F/r4NLojrQfxcmtlHttVbKqRpSGM1gFEXRIWFtWUYHDt7tZqy7EVhv root@DESKTOP-MHQMU53"
}

#### To Attach Elastic IP Address To Instance ####
resource "aws_eip" "lb" {
  instance = aws_instance.demo.id
  vpc      = true
}

#### Creating EFS File System ####
resource "aws_efs_file_system" "my_nfs" {
  creation_token = "my_nfs"
  encrypted      = true

  tags = {
    Name = "my_nfs"
  }
}

#### Mounting EFS File System ####
resource "aws_efs_mount_target" "mount" {
  file_system_id  = aws_efs_file_system.my_nfs.id
  subnet_id       = aws_instance.demo.subnet_id
  security_groups = [aws_security_group.my_secgp.id]

  #security_groups = ["${aws_security_group.my_secgp.id}"]


}

resource "aws_efs_access_point" "this" {
  file_system_id = aws_efs_file_system.my_nfs.id
}


# #### For show output on command line which you want to display ####
# output "aws_security_group" {
#   value = aws_instance.demo
# }