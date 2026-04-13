
output "container_name" {
  value = docker_container.nginx_container.name
}

output "container_port" {
  value = docker_container.nginx_container.ports[0].external
}
