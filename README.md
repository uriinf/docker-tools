docker-tools
===============
Link to docker hub https://hub.docker.com/r/uriinf/tools

Based on ubuntu 16.04 container includes ansible stable 2.2, terraform and awscli.  
https://hub.docker.com/r/uriinf/tools/

## ansible example
```bash
ANSIBLE_RETRY_FILES_ENABLED=0 docker run -it --rm -v $(pwd)/test:/workspace -w /workspace uriinf/tools ansible-playbook -i ./hosts play.yml
 ```
 ## terraform example
 ```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform init
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform apply -auto-approve
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform destroy -auto-approve
rm -rf rm -rf test/.terraform test/*.tfstate*
```
