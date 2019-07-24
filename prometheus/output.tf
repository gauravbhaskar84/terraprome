output "Prometheus-URL" {
  description = "URL for Prometheus:"
  value       = "http://${aws_instance.test-instance.private_ip}:9090"
}