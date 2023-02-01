resource "aws_msk_scram_secret_association" "pike" {
  count           = length(var.secret_arn_list)
  cluster_arn     = aws_msk_cluster.pike.arn
  secret_arn_list = var.secret_arn_list[count.index]
}

variable "secret_arn_list" {
  type        = list(any)
  description = "secrets arns"
  default=[]
}