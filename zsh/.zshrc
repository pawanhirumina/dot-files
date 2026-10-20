# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Theme Settings
export TERM=xterm-256color
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=/.config/zsh/.zshrc
plugins=(git)

## Example aliases
alias cl="clear"
alias py="python3"
alias ff="fastfetch"
alias ls="eza --icons -a -X"
alias nv="nvim"


scs-on() {
  command scrcpy --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M "$@" </dev/null &>/dev/null &!
}

scs-off() {
  command scrcpy --turn-screen-off --stay-awake --power-off-on-close --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M "$@" </dev/null &>/dev/null &!
}


alias gs="git status" 
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias gi="git init"
alias gcl="git clone"

ZSH_THEME='apple'

export PATH=$HOME/.local/bin:$PATH


# Android SDK
export ANDROID_HOME="$HOME/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# Android SDK tools
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export ANDROID_HOME=$HOME/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Android/sdk/platform-tools
export ANDROID_HOME=$HOME/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"
