
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias updatezsh="source ~/.zshrc"
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
eval "$(oh-my-posh init zsh --config $HOME/.oh-my-zsh/themes/illusi0n.omp.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.oh-my-zsh/themes/1_shell.omp.json)"


######### react native #########
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export NDK_HOME=$ANDROID_SDK_ROOT/ndk/25.1.8937393
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

######### zsh theme #########


######### alias #########
alias yd="yt-dlp -f bestvideo+bestaudio --cookies-from-browser chrome "
alias lg="lazygit "
alias vim="nvim "
alias yz="yazi"
alias aic="aicommit2 "
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export EDITOR="nvim"
export VISUAL="nvim"

######### java #########

export JAVA_HOME_8=/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home
export JAVA_HOME_11=/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home
export JAVA_HOME_17=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_17
export JRE_HOME
export PATH
export CLASSPATH
JRE_HOME=$JAVA_HOME/jre
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
alias jdk8="export JAVA_HOME=$JAVA_HOME_8"
alias jdk11="export JAVA_HOME=$JAVA_HOME_11"
alias jdk17="export JAVA_HOME=$JAVA_HOME_17"

export PATH="/opt/homebrew/opt/gradle@7/bin:$PATH"
export PATH="$PATH:/Users/bto/fvm/versions/3.22.0/bin"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/bto/.dart-cli-completion/zsh-config.zsh ]] && . /Users/bto/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/Applications/nvim/bin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
