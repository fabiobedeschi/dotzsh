alias sudo='sudo '  # Allow sudo aliases expansion

alias 0='cd ~'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

alias bcubc='brew upgrade --cask && brew cleanup'
alias bcubo='brew update && brew outdated --cask'
alias brewp='brew pin'
alias brewsp='brew list --pinned'
alias bubc='brew upgrade && brew cleanup'
alias bubo='brew update && brew outdated'
alias bubu='bubo && bubc'
alias buf='brew upgrade --formula'

alias cat="${CAT:-cat}"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias t='tail -f'
alias p='ps -f'
alias mmv='noglob zmv -W'

if type docker-compose &> /dev/null; then
    alias dco=docker-compose
else
    alias dco='docker compose'
    alias docker-compose='docker compose'
fi
alias dcb='dco build'
alias dcdn='dco down'
alias dce='dco exec'
alias dck='dco kill'
alias dcl='dco logs'
alias dclf='dco logs -f'
alias dcps='dco ps'
alias dcpull='dco pull'
alias dcr='dco run'
alias dcrestart='dco restart'
alias dcrm='dco rm'
alias dcstart='dco start'
alias dcstop='dco stop'
alias dcup='dco up'
alias dcupb='dco up --build'
alias dcupd='dco up -d'

alias ed="${EDITOR:-nano}"

alias f=fuck
alias fzfp='fzf --preview "${FZF_CAT}"'

alias gemsets='rbenv gemset list'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gtr='git log --oneline --decorate --graph --all'
alias gtrl='git log --graph --pretty='\''%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(bold magenta)(%ar) %C(bold blue)<%an>%Creset'\'' --all'

alias h=history
alias hgrep='fc -El 0 | grep'
alias hs='history | grep -i'
alias https='http --default-scheme=https'

alias ls='ls -FhG --color=always --group-directories-first'
alias ll='ls -lFh'
alias lS='ls -1FSsh'
alias la='ls -laFh'
alias lart='ls -1Fcart'
alias l.='ls -ld .*'
alias lr='ls -tRFh'
alias lrt='ls -1Fcrt'
alias lsn='ls -1'
alias lsr='ls -laRFh'
alias lt='ls -ltFh'
alias l=ll
alias lzd=lazydocker
alias lzg=lazygit

alias mi=micro

alias nmap_check_for_firewall='sudo nmap -sA -p1-65535 -v -T4'
alias nmap_check_for_vulns='nmap --script=vuln'
alias nmap_detect_versions='sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn'
alias nmap_fast='nmap -F -T5 --version-light --top-ports 300'
alias nmap_fin='sudo nmap -sF -v'
alias nmap_full='sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v'
alias nmap_full_udp='sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 '
alias nmap_full_with_scripts='sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all '
alias nmap_list_interfaces='nmap --iflist'
alias nmap_open_ports='nmap --open'
alias nmap_ping_scan='nmap -n -sP'
alias nmap_ping_through_firewall='nmap -PS -PA'
alias nmap_slow='sudo nmap -sS -v -T1'
alias nmap_traceroute='sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute '
alias nmap_web_safe_osscan='sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy '

alias pandoc='pandoc --defaults=/Users/fabio/.local/share/pandoc/defaults.rb'
alias pip=pip3
alias pipir='pip install -r requirements.txt'
alias pipreq='pip freeze > requirements.txt'
alias python=python3

alias rpath='PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"'

alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias sortnr='sort -n -r'

alias tf=terraform

alias unexport=unset
alias untar='tar -xvzf'
alias utcnow='date -u && date -u +%s'

alias wanip='dig @resolver4.opendns.com myip.opendns.com +short'
alias which-command=whence

alias y=yay

alias z='_z 2>&1'
alias zshrc='ed $HOME.zshrc'

if type xdg-open &> /dev/null; then
	alias open='xdg-open'
fi
