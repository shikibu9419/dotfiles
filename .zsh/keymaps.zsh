### The functions whose name starts with '_' define in .zsh/functions.zsh

# bindkeys
zle -N _select_history
zle -N _ghq_list_repositories
zle -N _git_list_log
zle -N _git_list_checkout

bindkey -v
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^e' autosuggest-accept
bindkey '^t' forward-word  # autosuggest-partial-accept
bindkey '^r' _select_history
bindkey '^]' _ghq_list_repositories
bindkey '^b' _git_list_checkout

# git
alias git='hub'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gcadd='git commit -am'
alias gca='git commit --amend'
alias gcl='git clone'
alias gch='git checkout'
alias gd='git diff'
alias gl='git log'
alias gp='git push'
alias gpl='git pull --rebase'
alias grb='git rebase'
alias grs='git reset'
alias grm='git remote'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gsee='git see'
alias gpr='git pull-request'
alias gw='git worktree'

alias glog=_git_list_log
alias gpush=_git_push_origin
alias gremote=_git_remote_origin
alias gwork=_git_list_worktree
alias gwa=_git_worktree_add

# rails
alias railc='rails c'

# ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'

# color=auto
alias ls='gls --color=auto'
alias grep='grep --color=auto'

# others
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias ql='qlmanage -p $@ >& /dev/null'
alias reload='source ~/.zshenv && source ~/.zshrc'
