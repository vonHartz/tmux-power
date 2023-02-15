# Tmux Powerline Theme with Git Integration

I hacked together [tmux-power](https://github.com/wfxr/tmux-power) and [tmux-git](https://github.com/drmad/tmux-git).

There's still some cleanup to do, before I could submit a PR to tmux-power.
All credit to the original authors.

## Prelimenaries

You need a terminal font that inlcudes glyphs, such as Nerdfont.
I recommand the Hack Mono or Ubuntu font.
Both can be found here: https://www.nerdfonts.com/font-downloads

## Installation

Clone this project in your home directory - currently needed due to an amateurish import of 'functions.sh'.

```
git clone git@github.com:vonHartz/tmux-power.git
```

Add the power theme to your `.tmux.conf`:

```
# tmux power theme
run-shell ~tmux-power/tmux-power.tmux
set -g @tmux_power_theme 'forest'
```

If you haven't already, make tmux source your bashrc by adding the following to your `.profile` ([source](https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file)):
```
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
```

Then, execute this line in a shell to add the script in the Bash initialization file (usually `.bashrc`, replace if needed):

    echo "if [[ \$TMUX ]]; then source ~/tmux-power/tmux-power-update-ls.sh; fi" >> ~/.bashrc

Run `tmux`, `cd` to a Git repo, and enjoy :)

**Note for OSX users**: You'll need to install `coreutils`:

    brew install coreutils
