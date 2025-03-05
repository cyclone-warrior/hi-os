#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -n $PS1 && -f ~/.bash_prompt ]]; then
  . ~/.bash_prompt
  ps1_blue_theme  # Choose your theme here
fi

PACMAN_CONF="/etc/pacman.conf"
if ! grep -q "^\[blackarch\]" "$PACMAN_CONF"; then
    echo -e "\n[blackarch]" | sudo tee -a "$PACMAN_CONF" > /dev/null
    echo -e "\nInclude = /etc/pacman.d/blackarch-mirrorlist" | sudo tee -a "$PACMAN_CONF" > /dev/null
fi

