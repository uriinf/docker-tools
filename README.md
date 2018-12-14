# docker-tools

Based on python3 container includes ansible stable 2.7, terraform and awsclii.

## Build locally

```sh
docker build -t local/tools
```

## ansible usage example

```sh
ANSIBLE_RETRY_FILES_ENABLED=0 docker run -it --rm -v $(pwd)/test:/workspace -w /workspace local/tools ansible-playbook -i ./hosts play.yml
 ```

## terraform usage example

 ```sh
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace local/tools terraform init
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace local/tools terraform apply -auto-approve
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace local/tools terraform destroy -auto-approve
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/test:/workspace -w /workspace local/tools rm -rf rm -rf .terraform *.tfstate*
```
