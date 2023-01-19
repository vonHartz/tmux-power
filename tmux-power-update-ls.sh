#!/usr/bin/env bash

source ~/tmux-power/functions.sh

update_tmux() {
    # The trailing slash is for avoiding conflicts with repos with 
    # similar names. Kudos to https://github.com/tillt for the bug report
    CWD=`$READLINK -e "$(pwd)"`/

    LASTREPO_LEN=${#TMUX_GIT_LASTREPO}

    if [[ $TMUX_GIT_LASTREPO ]] && [ "$TMUX_GIT_LASTREPO" = "${CWD:0:$LASTREPO_LEN}" ]; then
        GIT_REPO="$TMUX_GIT_LASTREPO"

        # Get the info
        find_git_branch "$GIT_REPO"
        find_git_stash "$GIT_REPO"
        find_git_dirty

        GIT_FLAGS=($GIT_STASH)

    else
        find_git_repo
        
        if [[ $GIT_REPO ]]; then
            export TMUX_GIT_LASTREPO="$GIT_REPO"
            update_tmux
        else
            GIT_REPO=''
            GIT_BRANCH='(none)'
            GIT_DIRTY=''
        fi
    fi

    build_ls

    tmux_set status-left "$LS"

    tmux refresh-client -S
}

# Update the prompt for execute the script
case $SHELL in
    *zsh)
        if ! (($precmd_functions[(Ie)update_tmux])); then
            precmd_functions=($precmd_functions update_tmux)
        fi
        ;;
    *)
        PROMPT_COMMAND="update_tmux; $PROMPT_COMMAND"
        ;;
esac