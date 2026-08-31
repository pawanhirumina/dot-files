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
alias scs-on="scrcpy --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M"
alias scs-off="scrcpy -S  --video-codec=h264 --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC --max-size=1024 -b 4M"
alias gs="git status" 
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias gi="git init"
alias gcl="git clone"

## Prompt Shortcuts
PROMPT="%c%f  %# "
# %n = username
# %m = hostname
# %d = current path
# %~ = current folder
# %c = current path (only the folder you're in not the whole path)
# %# = $ or #
# %F{color_name} = add colors
# %f = reset colors
# %t = show current time
# %w = show current date
# %B = bold text (must be 'B' not 'b')
# %I = command line number

# Use prebuilt theme
 ZSH_THEME='apple'
# Custom Prompt
# Icons Unicode NerdFont
#  = linux icon / uf31a
#  = macos icon / uf302
#  = fedora icon / uf30a
#  = windows icon / f17a
#  = arch linux icon / uf303


export PATH=$HOME/.local/bin:$PATH
