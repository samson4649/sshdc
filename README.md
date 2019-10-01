# SSHd Drop Container

## Introduction

This project is for use in hosting environments where developers need direct access to data in a containerised environment. With this container you can provision access to the environment without exposing the underlying OS to the developers because, developers. 

## Usage

The Container is run with a username and password provided as environment variables

### From source

```bash
pull git.github.com/samson4649/sshdc.git
cd sshd-container
docker-compose build shell
# edit compose to suit
docker-compose up -d
```

### From DockerHub

```bash
docker pull samson4649/sshdc
docker run -dit --rm -p 2222:22 -v $(pwd)/mydata:/data_dump samson4649/sshdc
```







​	
