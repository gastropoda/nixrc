# borrowed from:
#
# http://robinwinslow.co.uk/2012/07/20/tmux-and-ssh-auto-login-with-ssh-agent-finally
#
if [ -z "$TMUX" ]; then
    # we're not in a tmux session

    if [ ! -z "$SSH_TTY" ]; then
        # We logged in via SSH

        # if ssh auth variable is missing
        if [ -z "$SSH_AUTH_SOCK" ]; then
            export SSH_AUTH_SOCK="~/.ssh/.auth_socket"
        fi

        # if socket is available create the new auth session
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
            `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
            echo $SSH_AGENT_PID > ~/.ssh/.auth_pid
        fi

        # if agent isn't defined, recreate it from pid file
        if [ -z "$SSH_AGENT_PID" ] ; then
          if [ ! -f ~/.ssh/.auth_pid ] ; then
            echo ${SSH_AUTH_SOCK/*.} > ~/.ssh/.auth_pid
          fi
          export SSH_AGENT_PID=`cat ~/.ssh/.auth_pid`
        fi

        # Add all default keys to ssh auth
        ssh-add 2>/dev/null

        # start tmux
        # tmux attach
    fi
fi
