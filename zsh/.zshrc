## Theme Settings
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
alias ls="ls -a"
alias ff="fastfetch"

## Prompt Shortcuts
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
# ZSH_THEME=''
# Custom Prompt
PROMPT='%B%F{white}  %n@%m %b				
 %~  %# %f'

# Icons Unicode NerdFont
#  = linux icon / uf31a
#  = macos icon / uf302
#  = fedora icon / uf30a
#  = windows icon / f17a
#  = arch linux icon / uf303


