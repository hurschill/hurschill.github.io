dev log #4

writing of this document began @~D20240324T1847H

alright. first, we recap the progress thus far:
old laptop, debian, passwordless sudoer, ssh, curl, git, tailscale, and a workstation to access it from.

we should probably get the docker engine installed. it's going to be important for many of the steps to follow.

docker docs can be found here: <https://docs.docker.com/engine/install/debian>

if you find documentation scary and just want to cheat, the steps are as follows:
(i'll add these in script form later...) (it's later now, and i just slammed all these snippets into a single bash file and full sent it. seems to work fine, lol. at time of writing, script name is `*/ledger/setup/docker/install-docker-engine.bash` -- this may change)
1. uninstall conflicting packages `for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done`
2. setup apt repo
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
3. install docker packages `sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
4. function check your install `sudo docker run hello-world`
5. check your terminal for the message 
```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

if you got the above message as output, you should be fine to continue. all signs point to docker now being setup and installed on the old laptop.

create a docker volume named `portainer_data` by running
```bash
docker volume create portainer_data
```
> may require root/sudo permissions to run

docker volumes are typically created within docker's volume mgmt sys but the exact location depends on your docker config. by default, docker manages volumes within its own directory structure, usually located in `/var/lib/docker/volumes/` (on linux systems)

run `docker volume inspect` to provide information about the volume such as mount point (which indicates where the volume is stored on the system)

to continue, the next step after creating `portainer_data` will be to create a `docker-compose.yml` file (`~/ledger/setup/docker/portainer/docker-compose.yml`) with the following contents:
```yml
version: "3.7"

services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: always
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /docker/portainer/portainer_data:/data
```
then, from the `~/ledger/setup/docker/portainer/` directory, run `sudo docker compose up -d`

> the `*/docker/portainer/docker-compose.yml` can be created anywhere on the system, but in this case will be included in the `ledger` project repository.

after running the above command, `portainer` should now be up and reachable on your tailnet at {ip_address}:{port} and the default port number is 9000 at the time of writing
