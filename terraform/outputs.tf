output "master_private_ip" {
  value = aws_instance.master.private_ip
}

output "worker_private_ips" {
  value = [for w in aws_instance.worker : w.private_ip]
}

output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "worker_public_ips" {
  value = [for w in aws_instance.worker : w.public_ip]
}
