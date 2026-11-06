# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git z)

source $ZSH/oh-my-zsh.sh

autoload -Uz add-zsh-hook


alias cl="clear"
alias py="python3"
alias ff="fastfetch"
alias ls="eza --icons -a -X"
alias nv="nvim"

alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias gi="git init"
alias gcl="git clone"

fk() {
  local line pid
  line=$(ps -eo pid,ppid,%cpu,%mem,comm,args --sort=-%cpu | awk '!seen[$5]++' | fzf --header="Select process to kill (main processes only)" --with-nth=1,3,4,5)
  pid=$(echo "$line" | awk "{print \$1}")
  [ -n "$pid" ] && kill -9 "$pid"
}
scs-on() {
  command scrcpy --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M "$@" </dev/null &>/dev/null &!
}
scs-off() {
  command scrcpy --turn-screen-off --stay-awake --power-off-on-close --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M "$@" </dev/null &>/dev/null &!
}

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

export PATH=/home/pawanhirumina/.opencode/bin:$PATH

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"