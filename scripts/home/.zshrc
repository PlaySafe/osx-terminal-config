# Git alias config
alias gd="git diff"
alias gdt="git difftool"
alias gc="git clean"
alias gcl="git clone"
alias gs="git status"
alias ga="git add"
alias gcm="git commit"
alias gco="git checkout"
alias gt="git tag"
alias gdl="gradle"
alias gb="git branch"
alias gl="git log"
alias glg="git log --all --graph --decorate"
alias grs="git reset"
alias gp="git pull"
alias gpo="git pull origin"
alias gst="git stash"
alias gf="git fetch --tags --prune"
alias gwt="git worktree"
alias gob="go build"
alias gor="go run"
alias got="go test"

# Docker alias config
alias dk="docker"
alias dkcp="docker compose"

# Kubernetes
alias mnk="minikube"
alias kcl="kubectl"

# Brew alias config
alias bug="brew upgrade"
alias bud="brew update"
alias bi="brew info"
alias bs="brew search"
export GPG_TTY=$(tty)

# Golang Config
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
alias cobra="cobra-cli"

# Config JDTLS
export JAVA_HOME="/usr/local/Cellar/openjdk@17/17.0.4.1_1/libexec/openjdk.jdk/Contents/Home"
export M2_HOME="$HOME/.m2"
export MAVEN_HOME="/usr/local/Cellar/maven/3.8.6/libexec"
export WORKSPACE="$HOME/workspace"

# Terminal & OS Config
alias ll="ls -lah"
alias sup="softwareupdate"
alias vim="nvim"
export PATH="/usr/local/opt/openjdk@17/bin:$PATH:$GOBIN"
autoload -Uz compinit && compinit

function git_branch() {
    branch=$(git branch --show-current 2> /dev/null)
    if [[ ! -z "$branch" ]] then
        # modify=$(git status -s | wc -l | xargs 2> /dev/null)
        echo "  $branch"
    fi
}

COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;243m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT=' ${COLOR_DIR}%.${COLOR_GIT}$(git_branch)${COLOR_DEF}  '

