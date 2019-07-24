output "server_id1" {
  value = "${element(aws_instance.test-instance.*.id, 0)}"
}

output "server_id2" {
  value = "${element(aws_instance.test-instance.*.id, 1)}"
}