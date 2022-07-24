# resource "aws_s3_bucket" "buket" {
#   bucket = "Farri7511564"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_acl" "ex" {
#   bucket = aws_s3_bucket.buket.id
#   acl    = "private"
# }
