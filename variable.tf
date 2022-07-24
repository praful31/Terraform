# # # Variables Types :- 1)String 2)Number 3)List 4)Boolian/bool 5)map 6)any 

# # ########## Variable For Sting  #############

# # variable "string_var" {
# #   type    = string
# #   default = "Rocky"
# # }

# # variable "string_var2" {
# #   type    = string
# #   default = "Sunny"
# # }

# # ########## Variable For Number  #############

# # variable "number_var" {
# #   type    = number
# #   default = 12345
# # }


# # ########## Variable For List  #############

# # variable "list_var" {
# #   type    = list(any)
# #   default = ["pencil", "pen", "rubber", "sharpner"]
# #   #                0      1       2          3
# # }


# # ########## Variable For Map  #############

# # variable "map_var" {
# #   type = map(any)
# #   default = {
# #     u1 = "user_1"
# #     u2 = "gajju"
# #     u3 = "user_3"
# #   }
# # }


# # ########## Variable For Any  #############

# # variable "any_var" {
# #   type = any
# #   default = {
# #     u1 = "Farrari"
# #     u2 = ["pencil", "pen", "rubber", "sharpner"]
# #     u3 = 786
# #     u4 = {
# #       u41 = "AWS"
# #       u42 = "AZURE"
# #       u43 = "GCP"
# #     }
# #   }
# # }


# # ########## Variable For Boolian  #############

# # variable "string_var3" {
# #   type    = string
# #   default = "Rock"
# # }
# # variable "boolian_var" {
# #   type    = bool
# #   default = true
# # }



##### Instance Variables #####

variable "i_type" {
  type = string
  # default = "t2.micro"
}

variable "avlb_zn" {
  type = string
  # default = "us-east-1"
}

# variable "key_name" {
#   type = string
#   # default = "northvirginiakey"
# }

variable "vpc_id" {
  type = string
  # default = "vpc-09b0c2db9759696cb"
}

variable "tag" {
  type = string
  #default = "Terraform"
}