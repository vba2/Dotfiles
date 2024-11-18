# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jstrebeck/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="miloshadzic-jstrebeck"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws terraform virtualenv docker kubectl kube-ps1)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Pewferred editor
export VISUAL=nvim
export EDITOR=nvim

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#Run script in ~/bin
export PATH=~/bin:$PATH

alias gg='lazygit'
alias y='yazi'

#Python env
alias activate='source venv/bin/activate'
#alias tfa_vars='tfa -var-file '
#alias tfp_vars='tfp -var-file '
#alias tfd_vars='tfd -var-file '


#Window Management
# alias yabai='/usr/local/Cellar/yabai/5.0.2/bin/yabai &'

#Terraform
tfp_vars (){
    workspace="$(command terraform workspace show 2>/dev/null)"
    tfp -var-file env/${workspace:l}.tfvars $1 $2
}

tfa_vars (){
    workspace="$(command terraform workspace show 2>/dev/null)"
    tfa -var-file env/${workspace:l}.tfvars $1 $2 && \
    say Terraform applied
}

tfd_vars (){
    workspace="$(command terraform workspace show 2>/dev/null)"
    tfd -var-file env/${workspace:l}.tfvars $1 $2 && \
    say Terraform applied
}

alias tfws='terraform workspace select'

##Terraform Prod
tfp_vars_prod (){
    workspace="$(command terraform workspace show 2>/dev/null)"
    AWS_PROFILE=prod terraform init -backend-config=env/${workspace:l}.tfbackend -reconfigure && \
    terraform workspace select ${workspace:1} && \
    tfp -var-file env/${workspace:l}.tfvars $1
}


alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

alias gp-stop='launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'

alias gp-start='launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'

alias gp-restart='launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp* && launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'


#Docker
alias docker-stopall='docker rm -f $(docker ps -aq)'
##PT-microservices
alias aws-ecrsignin=""
alias docker-buildssl="docker build --target ssl -t $(basename $(pwd)) ."
alias docker-current="servicename=$(basename $(pwd)) && echo $servicename"
alias docker-push=""

alias hosts="sudo nvim /etc/hosts"
alias zshrc="sudo nvim ~/.zshrc"
alias yabairc="sudo nvim ~/.config/yabai/yabairc &"
alias skhdrc="sudo nvim ~/.config/skhd/skhdrc"


alias amend="git commit --amend --no-edit && git pull --rebase && gp"

#Prod
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# alias awssso="aws sso login"
#Kube
alias k="kubectl"

#AWS
alias asl="aws sso login"

#Ecs
alias e="e1s"
alias pt-ms="gh repo list PayTrace -L 1000 --json name | jq -r '.[] | .name' | fzf"

#Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


#SSH
# alias sshjs="ssh -i ~/.ssh/lwr_techops.pem ubuntu@$(aws ec2 describe-instances --filters "Name=tag:Name,Values=js_lin*" --query "Reservations[].Instances[].PrivateIpAddress" --output text)"
eval `ssh-agent -s`
ssh-add ~/.ssh/devcloud


#VIM Mode
set -o vi
# eval "$(/bin/brew shellenv)"
source /etc/profile.d/rvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#Pomodoro
declare -A pomo_options
pomo_options["work"]="50"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Battery
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage|to \empty"'
