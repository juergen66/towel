# ~/.bashrc: executed by bash(1) for non-login shells.

PATH="~/bin/:${PATH}"
export PATH
. /usr/share/bash-completion/bash_completion

# Make GPG good:
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

