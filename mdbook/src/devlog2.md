dev log #2

writing of this document began @~D20240319T0518Z

this log is written from the perspective that you have an old laptop with a fresh install of debian

if you haven't already setup the user account you're working from to be a passwordless sudoer, then you could do that now.
it's quick, makes your life easy, and is *totally* a very smart idea with no impact to the security of your system.
`echo "$username ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/$username`
*(replace $username with the username of the account to grant passwordless sudoer permission to)*

make sure you have `curl` installed for the next step
`sudo apt install -y curl`

if you haven't already, sign up for tailscale using your google, github, or other oauth-enabled account.
for more information on tailscale, visit: `https://tailscale.com/download/linux`
-> run: `curl -fsSL https://tailscale.com/install.sh | sh`
-> then: `sudo tailscale up`
-> follow the authenication link printed to the terminal
-> and login to your account
**tailscale should now be setup.**

i didn't feel like writing anymore tonight because it felt like i'd end up getting lazy and missing some steps.
to recap, at this point you should have an old laptop with debian stable installed, an account with passwordless sudoer permissions, curl installed, and tailscale installed+up & running. other devices on your tailnet should be able to connect to this machine now.
