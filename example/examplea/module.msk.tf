module "msk" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = ["subnet-05808ec64faaa18ba", "subnet-0b57d1924ea055989", "subnet-05f8f3c120238ca8d"]
}
