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
alias gpo="git pull origin $(git branch --show-current)"
alias gst="git stash"
alias gf="git fetch --tags --prune"
alias gwt="git worktree"
alias grlc="git reflog expire --expire=5.days.ago --expire-unreachable=now"

# Maven alias
alias mcc="mvn clean compile"
alias mcp="mvn clean package"
alias mct="mvn clean test"
alias mci="mvn clean install"
alias mdt="mvn dependency:tree"
alias mdl="mvn dependency:list"
alias mvndoc="mvn dependency:resolve -Dclassifier=javadoc"
alias mvnsrc="mvn dependency:sources"
alias mvnnew="mvn archetype:generate -DgroupId=com.example -DartifactId=myproject -DinteractiveMode=false"

# Docker alias config
alias di="docker image"
alias dcp="docker compose"
alias dc="docker container"
alias db="docker build"
alias dr="docker run"
alias dbp="docker builder prune"

# Kubernetes
alias mkc="minikube"
alias kc="kubectl"

# Brew alias config
alias bug="brew upgrade"
alias bud="brew update"
alias bi="brew info"
alias bs="brew search"
alias bod="brew outdated"
alias bcu="brew cleanup --prune=all"
export GPG_TTY=$(tty)


# Golang
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
alias cobra="cobra-cli"
alias gob="go build"
alias gor="go run"
alias got="go test"

# Rust ConfigHOME/.cargo/bin
export RUSTPATH=$HOME/.cargo
export RUSTBIN=$RUSTPATH/bin
export RUSTENV=$RUSTPATH/env
export PATH="$PATH:$RUSTBIN:$RUSTENV"

# Config JDTLS
export JAVA_HOME="/usr/local/Cellar/openjdk@17/17.0.8.1/libexec/openjdk.jdk/Contents/Home"
export M2_HOME="$HOME/.m2"
export WORKSPACE="$HOME/workspace"
alias java8="export PATH='/usr/local/opt/openjdk@8/bin:$PATH'"
alias java11="export PATH='/usr/local/opt/openjdk@11/bin:$PATH'"
alias java17="export PATH='/usr/local/opt/openjdk@17/bin:$PATH'"
alias javahome8="export JAVA_HOME='/usr/local/Cellar/openjdk@8/1.8.0-382_1/libexec/openjdk.jdk/Contents/Home'"
alias javahome11="export JAVA_HOME='/usr/local/Cellar/openjdk@11/11.0.20.1/libexec/openjdk.jdk/Contents/Home'"
alias javahome17="export JAVA_HOME='/usr/local/Cellar/openjdk@17/17.0.8.1/libexec/openjdk.jdk/Contents/Home'"

# Terminal & OS Config
alias ff="find . -iname"
alias ll="ls -lah"
alias sup="softwareupdate"
alias vim="nvim"
alias myip="ifconfig en0 | grep inet | awk '{ print $2 }'"
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

alias lg="ledger"
