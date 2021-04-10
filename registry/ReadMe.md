## Docker Registry
#### Set up your own private registry in your host

docker-compose configuration is very simple and does the following:
- __defines container (name, hostname)__
- __defines images__
- __defines environment variables in our .env file__
- __exposes ports__

  _Note: if we dont expose ports our registry will only be visible within our docker network_
- __sets volumes__

  - ./registry_data is our registry's data
  - ./auth is the directory which hosts our htpasswd file
  ```bash
  # how to create your auth, in order to secure your registry with password
  sudo apt install apache2-utils
  mkdir auth && cd auth
  # htpasswd -Bbn {user} {password} > {filename}
  htpasswd -Bbn admin 1234 > registry.password
  ```
  _Note: check __registry.env__ for auth configuration_


- __defines under which docker network we want to deploy our registry__


#### Build and run:
```bash
  # Simple build and run by fetching its image from docker-hub
  docker-compose -f docker-compose.yml up -d
```

#### Useful commands
```bash
# view your repositories from your host
curl -X GET -u admin:1234 localhost:5000/v2/_catalog
# view your repositories from a docker container in the same network directly
# we set our container IP in docker-compose.yml
# Important! add your container IP  in /etc/docker/daemon.json in block 'insecure registries'
curl -X GET -u admin:1234 {container IP}:5000/v2/_catalog

# view your repositories from a docker container in the same network using your host as gateway
curl -X GET -u admin:1234 {gateway}:5000/v2/_catalog

# docker login
# same URIs as above
# e.g. with password from stdin
docker login -u admin localhost:5000
docker pull localhost:5000/{image}:{tag}
```

#### Extras:
_Note: A production-ready registry must be protected by TLS and should ideally use an access-control mechanism_

You can add official ssl or create your own self-signed ssl ca-certificates,
set your registry in another host and serve it under a domain like 'my-docker-registry.com'. Check the docker-compose-ssl.yml, registry.env and the links below:
- [insecure-registry](https://docs.docker.com/registry/insecure/)
- [secure-registry](https://docs.docker.com/registry/deploying/)
- [registry under nginx](https://docs.docker.com/registry/recipes/nginx/)

__In my opinion, serving a docker-registry under nginx or apache is a must if you have a startup or a small company and want to use docker efficiently.__
