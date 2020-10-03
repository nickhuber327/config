#!

prompt_setup_nick(){
  setopt localoptions extendedglob

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}:%{$reset_color%}%{$fg[white]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} * %{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  base_prompt='%{$fg[red]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[magenta]%}%m%{$reset_color%}%{$fg[white]%}|%{$reset_color%}%{$fg[green]%}%~%{$reset_color%}'
  post_prompt='%{$fg[cyan]%}%%>%{$reset_color%}'

  base_prompt_nocolor=${base_prompt//\%\{[^\}]##\}}
  post_prompt_nocolor=${post_prompt//\%\{[^\}]##\}}

  autoload -U add-zsh-hook
  add-zsh-hook precmd prompt_huber_precmd
}

prompt_huber_precmd(){
    setopt localoptions extendedglob

    local gitinfo=$(git_prompt_info)
    local gitinfo_nocolor=${gitinfo//\%\{[^\}]##\}}
    local exp_nocolor="$(print -P \"$base_prompt__nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
    local prompt_length=${#exp_nocolor}

    PROMPT="${base_prompt}${gitinfo}${post_prompt}"
}

prompt_setup_nick
