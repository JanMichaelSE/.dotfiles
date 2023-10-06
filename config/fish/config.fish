set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

#aliases
alias c clear
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Commenting out for now until I understand this better
# function user
#   command pass show $argv | grep "user" | cut -d " " -f2 | wl-copy
# end
#
# function email
#   command pass show $argv | grep "email" | cut -d " " -f2 | wl-copy
# end

function mkcd
    mkdir -p $argv; and cd $argv[-1]
end

# Add Cargo to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# Setup Aliases
if type -q exa
  alias ll "exa -lFh -g --icons"
  alias lla "exa -lFah -g --icons"
else
  alias ll "ls -lFh"
  alias lla "ls -laFh"
end

if type -q bat
 alias cat "bat"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

# Update System
function system-updater
  sudo apt-get update -y &&
  sudo apt-get upgrade -y &&
  sudo apt-get clean -y &&
  sudo apt-get autoclean -y &&
  sudo apt-get autoremove -y --purge
  sudo snap refresh
end

#n (node version manager)
set -x N_PREFIX "$HOME/.n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
