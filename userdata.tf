# resource "aws_instance" "demo" {
#   ami           = "ami-0cff7528ff583bf9a" # us-east-1
#   instance_type = "t2.micro"
#   key_name      = "northvirginiakey"
#   user_data     = <<EOF
# 		#! /bin/bash
#                 sudo apt-get update
# 		sudo apt-get install -y apache2
# 		sudo systemctl start apache2
# 		sudo systemctl enable apache2
# 		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
# 	EOF
# }
# # tags = {
# # 	Name = "Terraform"	
# # }
# # 