resource "aws_sqs_queue" "queue" {
  name = "${var.environment_name}-queue"
}

output "queue_url" {
  value = aws_sqs_queue.queue.id
}
