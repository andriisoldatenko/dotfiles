alias gvim=vim
alias k=kubectl
alias kc='kubecolor'
alias kctx='kubectx'
alias kns='kubens'
alias gs='git status'
alias gls='git last |pbcopy'
alias dy='cd $HOME/work/dynatrace-operator'
alias dyi='cd $HOME/work/dynatrace-operator-internal'
alias dydoc='cd $HOME/work/dynatrace-docs'
alias blog='cd $HOME/work/asoldatenko.org'
alias kdf='kubectl delete -f'
alias k9s='sofka'

kgpi() {
  default_ns=${1:-dynatrace}
  kubectl get po -n $default_ns -o custom-columns='POD_NAME:.metadata.name,IMG:.spec..image'
}

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv --sort=-committerdate) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

jwt_decode() {
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<<"$1"
}
