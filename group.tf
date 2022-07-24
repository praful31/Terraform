# ## Group Create ##
# resource "aws_iam_group" "dev1" {
#   name = "Demo"
# }
# resource "aws_iam_group" "dev2" {
#   name = "Read_only"
# }

# ## Add users in group ##
# resource "aws_iam_group_membership" "add_user_in_grp" {
#   name = "tf-testing-group-membership"

#   users = [
#     aws_iam_user.user-1.name,
#     aws_iam_user.user-2.name,
#     aws_iam_user.user-3.name,
#     aws_iam_user.user-4.name,
#     aws_iam_user.user-5.name,
#     aws_iam_user.user-6.name,
#     aws_iam_user.user-7.name,
#     aws_iam_user.user-8.name,
#     aws_iam_user.user-9.name,
#     aws_iam_user.user-10.name,
#   ]

#   group = aws_iam_group.dev1.name

# }