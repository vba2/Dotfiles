# Yay! High voltage and arrows!

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_TF_PROMPT_SUFFIX="%{$fg[red]%}|%{$reset_color%}"

ZSH_THEME_AWS_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_AWS_SUFFIX="%{$fg[red]%}|%{$reset_color%}"


ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$fg[red]%}|%{$reset_color%}"

KUBE_PS1_CTX_COLOR="green"
KUBE_PS1_NS_COLOR="magenta"
KUBE_PS1_PREFIX="%{$fg[red]%}[%{$reset_color%}"
KUBE_PS1_SUFFIX="%{$fg[red]%}]%{$reset_color%}"
KUBE_PS1_SYMBOL_USE_IMG=true
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE=true

PROMPT='$(kube_ps1)%{$reset_color%}$(virtualenv_prompt_info)%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(tf_prompt_info)$(aws_prompt_info)%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}->%{$reset_color%} '
