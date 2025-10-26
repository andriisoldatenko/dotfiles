alias gvim=vim
alias k=kubectl
alias kc='kubecolor'
alias kctx='kubectx'
alias kns='kubens'
alias gs='git status'
alias dy='cd $HOME/work/dynatrace-operator'
alias dydoc='cd $HOME/work/dynatrace-docs'
alias blog='cd $HOME/work/asoldatenko.org'
alias kgpi="kubectl get pods -n dynatrace -o jsonpath=\"{.items[*].spec['initContainers', 'containers'][*].image}\" | tr -s '[[:space:]]' '\n' | sort | uniq -c"

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv --sort=-committerdate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
