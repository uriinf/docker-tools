resource "docker_container" "tools" {
  name  = "tools"
  image = "local/tools"
  command = ["terraform", "version"]
}
