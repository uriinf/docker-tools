# docker-tools
Based on ubuntu 16.04 container includes ansible stable 2.2, terraform and awscli.  

## example
```bash
docker run --rm -it -v $(pwd)/workspace:/workspace uriinf/tools ansible-playbook -i /workspace/hosts /workspace/play.yml
docker run --rm -it -v $(pwd)/workspace:/workspace uriinf/tools terraform plan
 ```
