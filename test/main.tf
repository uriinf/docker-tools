resource "docker_container" "tools" {
  name  = "tools"
  image = "uriinf/tools"
  command = ["terraform", "version"]
}
