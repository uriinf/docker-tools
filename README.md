# docker-tools

Link to docker hub https://hub.docker.com/r/uriinf/tools

Based on ubuntu 16.04 container includes ansible stable 2.5, terraform and awscli.  

## Build locally

```sh
docker build -t local/tools . 
```

## ansible usage example

```sh
ANSIBLE_RETRY_FILES_ENABLED=0 docker run -it --rm -v $(pwd)/test:/workspace -w /workspace uriinf/tools ansible-playbook -i ./hosts play.yml
 ```

## terraform usage example

 ```sh
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform init
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform apply -auto-approve
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools terraform destroy -auto-approve
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace uriinf/tools rm -rf rm -rf .terraform *.tfstate*
```
