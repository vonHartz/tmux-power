# Tmux Powerline Theme with Git Integration

I hacked together [tmux-power](https://github.com/wfxr/tmux-power) and [tmux-git](https://github.com/drmad/tmux-git).

There's still some cleanup to do, before I could submit a PR to tmux-power.
All credit to the original authors.

## Installation

Clone this project in your home directory - currently needed due to an amateurish import of 'functions.sh'.

```
git clone git://github.com/drmad/tmux-git.git
```

Add the power theme to your `.tmux.conf`:

```
# tmux power theme
run-shell /home/jan/tmux-power/tmux-power.tmux 
set -g @tmux_power_theme 'forest'

# List of plugins
set -g @plugin 'wfxr/tmux-power'
```

Then, execute this line in a shell to add the script in the Bash initialization file (usually `.bashrc`, replace if needed):

    echo "if [[ $TMUX ]]; then source ~/tmux-power/tmux-power-update-ls.sh; fi" >> ~/.bashrc

Run `tmux`, `cd` to a Git repo, and enjoy :)

**Note for OSX users**: You'll need to install `coreutils`:

    brew install coreutils