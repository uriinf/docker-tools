# docker-tools
Based on ubuntu 16.04 container includes ansible stable 2.2, terraform and awscli.  

## ansible example
```bash
ANSIBLE_RETRY_FILES_ENABLED=0 docker run --rm -v $(pwd)/test:/workspace -w /workspace uriinf/tools ansible-playbook -i ./hosts play.yml
docker run --rm -it -v $(pwd)/workspace:/workspace uriinf/tools terraform plan
 ```
 ## terraform example
 ```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform apply
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform destroy -force
rm -rf *.tfstate*
```
