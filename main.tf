resource "aws_cloudwatch_metric_alarm" "dynamodb_write_capacity" {
  for_each = var.dynamodb_names

  ## metric
  namespace   = "AWS/DynamoDB"
  metric_name = "ConsumedWriteCapacityUnits"
  dimensions = {
    TableName = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 20
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "dynamodb-${each.value}-write-capacity"
  alarm_description = "DynamoDB ${each.value} write capacity units highly consumed. Normal is less than 20 or less."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_read_capacity" {
  for_each = var.dynamodb_names

  ## metric
  namespace   = "AWS/DynamoDB"
  metric_name = "ConsumedReadCapacityUnits"
  dimensions = {
    TableName = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 20
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "dynamodb-${each.value}-read-capacity"
  alarm_description = "DynamoDB ${each.value} read capacity units highly consumed. Normal is less than 20 or less."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}
