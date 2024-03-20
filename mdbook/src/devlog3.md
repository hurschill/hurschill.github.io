dev log #3

writing of this document began @~D20240319T1806H

prereqs:
this log is written from the perspective that you have an old laptop with a fresh install of debian as well as tailscale set up/connected and are working from a "remote" workstation (even if the two computers are right next to each other)

ssh:
for the beginning of this entry, one would be expected to log in and beging working from their remote workstation. with that said, this is easily accomplished by using `ssh` with the command being `ssh $username@$ipaddress` where `$username` and `$ipaddress` correspond to the information associated with the old laptop's system and tailnet connection.

git:
additionally, taking the time to do `sudo apt install -y git` plus a good old-fashioned `git config --global user.name "*"` and `git config --global user.email *@*.*` would be advisable on both systems. for remote git hosting to do its job effectively here, it'd be best to *at the least* have the project repository public **OR** if private, ensure both hosts have appropriate access. using the cli tool `gh` is also helpful, given that you're using github for remote git hosting. on debian, the command to install `gh` will be `sudo apt install -y gh` and for authentication, i would recommend `gh auth login` (and paste a token) or `gh auth login -w` to login via web.
