zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

neofetch

# Perform compinit only once a day.
autoload -Uz compinit

setopt EXTENDEDGLOB
for dump in $ZSH_COMPDUMP(#qN.m1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
  echo "Initializing Completions..."
done
unsetopt EXTENDEDGLOB
compinit -C

source ~/.zsh/.antigen.zsh

## TMUX
# Automatically start tmux
#ZSH_TMUX_AUTOSTART=true
#
# Automatically connect to a previous session if it exists
#ZSH_TMUX_AUTOCONNECT=true
#
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# antigen bundle brew
antigen bundle tmux
# antigen bundle pip
antigen bundle docker
# antigen bundle docker-compose
antigen bundle wd
antigen bundle fzf
antigen bundle sudo
# antigen bundle command-not-found

export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
# export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')
antigen bundle lukechilds/zsh-nvm

antigen bundle zpm-zsh/colorize
antigen bundle wfxr/forgit
# antigen bundle mafredri/zsh-async
# antigen bundle ashutoshdtu/zsh-fuzzy-search-and-edit
# antigen bundle romkatv/powerlevel10k

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Autocomplete
zstyle ':autocomplete:*' magic off
zstyle ':autocomplete:tab:*' completion select #select,cycle,insert,fzf
zstyle ':autocomplete:*' fuzzy-search off
zstyle ':autocomplete:*:too-many-matches' message \
  'Too many completions to fit on screen. Type more to filter or press Ctrl-I to open the menu.'
antigen bundle marlonrichert/zsh-autocomplete

# Autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=""
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
# antigen theme robbyrussell
antigen theme 'romkatv/powerlevel10k'

# Tell Antigen that you're done.
antigen apply

# Init fasd
eval "$(fasd --init auto)"

# Source local settings
[[ -f ~/.zsh/.zshrc.local ]] && source ~/.zsh/.zshrc.local
# Source aliases
[[ -f ~/.zsh/.zshrc.aliases ]] && source ~/.zsh/.zshrc.aliases
# Source keybindings
[[ -f ~/.zsh/.zshrc.keybindings ]] && source ~/.zsh/.zshrc.keybindings

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
