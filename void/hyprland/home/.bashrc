# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias cat='bat'
alias ls='ls --color=auto'
alias vim='nvim'
alias ff='fastfetch'
alias cls='clear'

PS1='[\u@\h \W]\$ '

# opencode
export PATH=/home/abxijth/.opencode/bin:$PATH
