# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k theme setup
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable UTF-8 locale (important for icons and symbols)
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Use patched Nerd Fonts for proper icon display
export TERM="xterm-256color"

# Uncomment the following line if you want to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Optional: Enable plugins (add plugins you need here)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k configuration file (if not already created, run `p10k configure`)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add Nerd Font binaries to PATH if installed
# Make sure you install and configure a Nerd Font in your terminal
# Uncomment and modify the path if necessary
# export PATH=$HOME/.local/share/fonts:$PATH

