# The following lines were added by compinstall

zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/knox/.zshrc'
plugins=(zsh-autosuggestions)
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install


#Theme

# System load
g_load=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "☉ System load : %.1f%", 100-$1 }'`

# Memory Usage
g_memory=`free -m | awk 'NR==2{printf "☉ Memory Usage: %.2f%", $3*100/$2 }'`

# Disk Usage
g_disk=`df -h | awk '$NF=="/"{printf "☉ Disk Usage: %.1f%", $5}'`

# System uptime
g_uptime=`uptime | awk -F'( |,|:)+' '{ if ($7=="min") m=$6; else { if ($7~/^day/) { d=$6; h=$8; m=$9} else {h=$6;m=$7}}}{print "☉ System uptime:",d+0,"days,",h+0,"hours"}'`

# array System information
g_listOfNames=("$g_load" "$g_memory" "$g_disk" "$g_uptime")

# System information
g_information=`
for value in "${g_listOfNames[@]}"; do
    printf "%-8s\n" "${value}"
done | column`

# logo igeek
igeek=' 
 _  _____           _
(_)/ ____|         | |
|_| |  __  ___  ___| | __
| | | |_ |/ _ \\/ _ \\ |/ /
| | |__| |  __/  __/   <
|_|\\_____|\\___|\\___|_|\\_\\\\ .io


'

# date time
g_date="\n$FG[038]⚫ Today is `date`"



# print
neofetch
print -P  $g_date

local g_status="%(?:%{$fg_bold[white]%}#➤ :%{$fg_bold[red]%}#➤ )"
# show staged changes in the repository
local g_changes="$FG[038][%c]%{$reset_color%}"
# Define prompts
#
PROMPT='ArchLinux@Knox > '

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"