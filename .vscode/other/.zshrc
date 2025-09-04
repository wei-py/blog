# theme
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/tokyo.omp.json)"

# alias
alias yd="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s'"
alias yz="yazi"
alias lg="lazygit"


# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles


# python version manage
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# editor
export EDITOR=nvim
export VISUAL=nvim

# LM Studio CLI (lms)
export PATH="$PATH:/Users/wx/.lmstudio/bin"
