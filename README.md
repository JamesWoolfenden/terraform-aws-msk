# terraform-aws-msk

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-msk/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-msk)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-msk.svg)](https://github.com/JamesWoolfenden/terraform-aws-msk/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-msk.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-msk/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-msk/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-msk&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-msk/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-msk&benchmark=INFRASTRUCTURE+SECURITY)

---

Terraform module to deploy a AWS managed Kafka cluster.

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

![alt text](./diagram/registry.png)

## Usage

Include this repository as a module in your existing Terraform code:

```terraform
module 'msk" {
  source           = "JamesWoolfenden/aws/msk"
  version          = "v0.2.30"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.msk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_kms_key.msk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_msk_cluster.pike](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster) | resource |
| [aws_msk_scram_secret_association.pike](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_scram_secret_association) | resource |
| [aws_security_group.msk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Kafka instance type | `string` | `"kafka.t3.small"` | no |
| <a name="input_jmx_exporter"></a> [jmx\_exporter](#input\_jmx\_exporter) | n/a | `bool` | `false` | no |
| <a name="input_msk"></a> [msk](#input\_msk) | n/a | <pre>object({<br>    cluster_name           = string<br>    kafka_version          = string<br>    number_of_broker_nodes = number<br>  })</pre> | <pre>{<br>  "cluster_name": "examplea",<br>  "kafka_version": "2.4.1",<br>  "number_of_broker_nodes": 3<br>}</pre> | no |
| <a name="input_node_exporter"></a> [node\_exporter](#input\_node\_exporter) | n/a | `bool` | `false` | no |
| <a name="input_public_access"></a> [public\_access](#input\_public\_access) | Broker node access | `string` | `"DISABLED"` | no |
| <a name="input_secret_arn_list"></a> [secret\_arn\_list](#input\_secret\_arn\_list) | secrets arns | `list(any)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Broker node disk size | `number` | `1000` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "Kafka:BatchAssociateScramSecret",
                "Kafka:BatchDisassociateScramSecret",
                "Kafka:CreateCluster",
                "Kafka:DeleteCluster",
                "Kafka:DescribeCluster",
                "Kafka:DescribeClusterOperation",
                "Kafka:DescribeClusterV2",
                "Kafka:GetBootstrapBrokers",
                "Kafka:ListScramSecrets",
                "Kafka:ListTagsForResource",
                "Kafka:UpdateBrokerCount",
                "Kafka:UpdateBrokerStorage",
                "Kafka:UpdateBrokerType",
                "Kafka:UpdateClusterConfiguration",
                "Kafka:UpdateClusterKafkaVersion",
                "Kafka:UpdateConnectivity",
                "Kafka:UpdateMonitoring",
                "Kafka:UpdateSecurity",
                "Kafka:UpdateStorage"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteVpcEndpoints",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcEndpoints",
                "ec2:DescribeVpcs",
                "ec2:RevokeSecurityGroupEgress"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "kms:CreateGrant",
                "kms:CreateKey",
                "kms:DescribeKey",
                "kms:EnableKeyRotation",
                "kms:GetKeyPolicy",
                "kms:GetKeyRotationStatus",
                "kms:ListResourceTags",
                "kms:ScheduleKeyDeletion"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "logs:AssociateKmsKey",
                "logs:CreateLogGroup",
                "logs:DeleteLogGroup",
                "logs:DeleteRetentionPolicy",
                "logs:DescribeLogGroups",
                "logs:DisassociateKmsKey",
                "logs:ListTagsLogGroup",
                "logs:PutRetentionPolicy"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

A terraform module to create a container registry (ECR - Elastic Container Registry) in AWS.
There are two policies attached, a life-cycle policy which details how to look after the containers and a permission policy which has a default allow allusers in the account.
I use this to store the customised containers I use in Codebuild and for storing containers for Fargate.

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-msk/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-msk/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2023 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
