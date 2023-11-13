## AWS CloudWatch Alarm for RDS Database Instances IO usage

This module creates CloudWatch alarms for all given DynamoDB that presents high usage of Read and Write Units, if the condiction matches a notification is sent to the informed SNS topic.

### Predefined values
| Key | Value |
|------|---------|
| Comparison operator | Greater Than Or Equal To Threshold |
| Statistic | Maximum |
| Threshold | 20 - normal is less than 20 |
| Evaluation period | 2 seconds |

## Usage:

```
module "example" {
    source = "github.com/VioletX-Dev/terraform-aws-cw-alarms-dynamodb?ref=main"

    alarm_notification_channel = "arn:aws:sns:us-east-1:1234567890:my-sns-notification-channel"
    dynamodb_names                  = ["table_1", "table_2", "table_3"]

}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.dynamodb_read_capacity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.dynamodb_write_capacity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_notification_channel"></a> [alarm\_notification\_channel](#input\_alarm\_notification\_channel) | It's a SNS that might send emails, page your Incident Response tool (Pager Duty, OpsGenie, VitorOps, etc) | `string` | n/a | yes |
| <a name="input_dynamodb_names"></a> [dynamodb\_names](#input\_dynamodb\_names) | DynamoDB database names to create the alarms. `e.g. rds_names = ["dbinstance_1", "dbinstance_2", "dbinstance_3"]` | `set(string)` | n/a | yes |

## Outputs

No outputs.
