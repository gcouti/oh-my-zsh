# Yay! High voltage and arrows!

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}u%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}ᓲ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⦻%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}▾%{$reset_color%}"        
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}▴%{$reset_color%}"         
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%}r%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}x%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}c"

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi  
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}
 

git_status () {
  local _branch="$(current_branch)"
  if [[ "$_branch" != "" ]]; then
    echo "$_result$(git_prompt_status)%{$reset_color%} %{$fg_bold[green]%}[$_branch]%{$reset_color%}"
  fi
}  

prompt_time () {
  echo "[%*]"
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
    local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
        prompt_segment blue black "(`basename $virtualenv_path`)"
    fi
}

PROMPT='%{$fg[cyan]%}%1~%{$reset_color%} '
RPS1='$(git_status)$(prompt_time)$EPS1'

