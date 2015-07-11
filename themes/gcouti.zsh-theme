# Yay! High voltage and arrows!

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}u%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}ᓲ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⦻%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}▾%{$reset_color%}"        
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}▴%{$reset_color%}"         
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}x%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}c"
   
git_status () {
  local _branch=$(current_branch)
  if [[ "$_branch" != "" ]]; then
    echo "$_result$(git_prompt_status)%{$reset_color%} %{$fg_bold[green]%}[$_branch]%{$reset_color%}"
  fi
}  

prompt_time () {
  echo "[%*]"
}

PROMPT='%{$fg[cyan]%}%1~%{$reset_color%} %{$fg[cyan]%}»%{$reset_color%} '
RPS1='$(git_status)$(prompt_time)$EPS1'

