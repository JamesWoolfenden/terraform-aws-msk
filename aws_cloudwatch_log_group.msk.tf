resource "aws_cloudwatch_log_group" "msk" {
  name              = "msk"
  retention_in_days = 90
}
