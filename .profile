# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    . "$HOME/.bashrc"
else 
    echo "Not running bash, did not source .bashrc"
fi
