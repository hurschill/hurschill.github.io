dev log #1

writing of this document began @~D20240312T0100Z

what you'll need:

- old laptop
- internet connection
- debian 12.5.0 (stable)
- google account
- tailscale
- vscode
- nano
- ssh
- bash
- python
- git
- github
- docker
- portainer
- pgadmin
- postgres
- sql
- bootstrap
- mdbook

0. this guide is going to assume that you're working from a workstation that is __**not**__ the old laptop being used as a server. this guide will be written from the perspective of a person with both machines locally available, but primarily operating from a "main" computer with the server being accessed remotely/over the network

1. you'll need to get the old laptop connected to the internet and running debian os (we were using 12.5.0 at the time of writing). this may include downloading the netinst .iso file, balena etcher/rufus, and going through the initial installation. furthermore, this guide assumes you have the prerequisite knowledge to do this on your own.

2. before you start, you'll *probably* want make sure you have a google and github account, and if you don't then make them (github at least, which you'll need an email for... such as gmail). for all intents and purposes, most people will already fulfill this requirement, and your "normal" accounts should work just fine.

3. use either your google or github account to signup for tailscale via oauth

4. on the computer you'll be using, make sure you have a serviceable text editor (at least). we use a combination of nano and vscode for pretty much everything.

5. sign up for tailscale. log in and setup both machines you'll be using. feel free to share the connection with a friend so they can also access your net. ssh from your "main" computer to your "server" computer when you're ready.

6. install git, configure git. this guide assumes you know how to do this. else, visit: <https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup>

7. install gh (cli tool). authenticate and login. `gh auth login -w` should take care of this. if you have trouble, read the docs.

8. clone the repository that corresponds to this guide. the repository of code and stuff that is used should be located at https://github.com/hurschill/ledger but it may have moved or something. check the "hurschill" organization if you're unable to clone the repository using the ledger project url listed.

9. now might be a good time to make sure you have bash and python + pip package manager available for use. if you do, create a virtual environment `python3 -m venv .venv` and activate it to install packages with `pip install -r requirements.txt` (`deactivate` to exit the virtual environment)

10. install docker and make sure it works by ***reading the docs*** (always read the docs) <https://docs.docker.com/engine/install/debian>

> at this point, it's basically all work inside containers from here on out. we haven't actually worked through this project to develop a production deployment solution yet.ultimately, you're going to need portainer, pgadmin, and postgres.

11. create some directories to put your docker stuff in. for example, if you cloned the project repository to `~/some_dir` then you could do `mkdir ~/some_dir/docker` and create the following:
- `~/some_dir/docker/portainer`
- `~/some_dir/docker/pgadmin`
- `~/some_dir/docker/postgres`

12. each container directory from step 11 will get its own docker-compose.yml followed by a `docker compose` command. we're working on making scripts to hold your hand while doing this part. don't forget to keep track of your username and password combinations used for your container things.

13. after getting portainer, pgadmin, and postgres up/working then a schema needs to be made plus a whole bunch of sql script will be run to create a basic database.

> at some point, creating an mdbook website may be advisable to keep track of how your app is created/deployed/etc. so you don't forget silly stuff along the way because "it wasn't that hard"

note from the devlog author: i got bored and stopped here to go watch a youtube video
