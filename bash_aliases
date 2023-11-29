alias gvim=vim
alias k=kubectl
alias kc='kubecolor'
alias kctx='kubectx'
alias kns='kubens'
alias vim=/opt/homebrew/bin/nvim
alias gs='git status'

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv --sort=-committerdate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
