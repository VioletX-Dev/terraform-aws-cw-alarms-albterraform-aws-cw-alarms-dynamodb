variable "alarm_notification_channel" {
  description = "It's a SNS that might send emails, page your Incident Response tool (Pager Duty, OpsGenie, VitorOps, etc)"
  type        = string
}

variable "dynamodb_names" {
  description = "DynamoDB database names to create the alarms. `e.g. rds_names = [\"dbinstance_1\", \"dbinstance_2\", \"dbinstance_3\"]`"
  type        = set(string)

}
