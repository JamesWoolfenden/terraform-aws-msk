resource "aws_msk_cluster" "pike" {
  cluster_name           = var.msk.cluster_name
  kafka_version          = var.msk.kafka_version
  number_of_broker_nodes = var.msk.number_of_broker_nodes

  broker_node_group_info {
    instance_type = var.instance_type
    storage_info {
      ebs_storage_info {
        volume_size = var.volume_size
      }
    }
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.msk.id]
    connectivity_info {
      public_access {
        type = var.public_access
      }
    }
  }
  client_authentication {
    sasl {
      scram = true
    }
  }
  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.msk.arn

    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = var.jmx_exporter
      }

      node_exporter {
        enabled_in_broker = var.node_exporter
      }
    }

  }
  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk.name
      }
    }
  }
}

resource "aws_kms_key" "msk" {
  enable_key_rotation = true
}


resource "aws_security_group" "msk" {
  name        = "msk"
  description = "Security group for the msk cluster"
}

variable "instance_type" {
  type        = string
  description = "Kafka instance type"
  default     = "kafka.t3.small"
}

variable "msk" {
  type = object({
    cluster_name           = string
    kafka_version          = string
    number_of_broker_nodes = number
  })
  default = {
    cluster_name           = "examplea"
    kafka_version          = "2.4.1"
    number_of_broker_nodes = 3
  }
}

variable "volume_size" {
  type        = number
  description = "Broker node disk size"
  default     = 1000
}

variable "public_access" {
  type        = string
  description = "Broker node access"
  default     = "DISABLED"
}

variable "jmx_exporter" {
  type    = bool
  default = false
}

variable "node_exporter" {
  type    = bool
  default = false
}
