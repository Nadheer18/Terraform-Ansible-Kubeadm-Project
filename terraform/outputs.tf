output "all_nodes_public_ips" {
  value = merge(
    {
      "k8s-master" = aws_instance.master.public_ip
    },
    {
      for idx, w in aws_instance.worker :
      "k8s-worker-${idx + 1}" => w.public_ip
    },
    {
      "DevOps-Server"  = aws_instance.DevOps-Server.public_ip
      "jenkins-server" = var.enable_Jenkins ? aws_instance.jenkins[0].public_ip : null
    }
  )
}


output "all_nodes_private_ips" {
  value = merge(
    {
      "k8s-master" = aws_instance.master.private_ip
    },
    {
      for idx, w in aws_instance.worker :
      "k8s-worker-${idx + 1}" => w.private_ip
    },
    {
      "DevOps-Server"  = aws_instance.DevOps-Server.private_ip
      "jenkins-server" = var.enable_Jenkins ? aws_instance.jenkins[0].private_ip : null
    }
  )
}

output "Jenkins-Server_url" {
  value = var.enable_Jenkins ? "http://${aws_instance.jenkins[0].public_ip}:8080" : null
}