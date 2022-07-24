### Used Sudo Because It Run As Local User ###
## Installation of Java and Jenkins ### 
locals {
  user_data = <<EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install openjdk-11-jre-headless -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo jenkins --version
systemctl start jenkins
systemctl enable jenkins
sudo apt-get install nfs-common -y
echo "${aws_efs_file_system.my_nfs.dns_name}:/ /mnt nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a	
  EOF
}



# 1. Source/ip Address
# 2. Mounting Point
# 3. file_system
# 4. defaults
# 5. 0
# 6. 0




