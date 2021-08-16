alias zz='clear'
alias dc='docker-compose'
alias dcu='dc up'
alias dcud='dc up -d'
alias dcd='dc down'
alias dcdrm='dc down --remove-orphans'

#Get containers
alias dps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"
alias dpsa="dps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

#Docker Volumes
alias dvol="docker volume"
alias dvin='docker volume inspect'
alias dvls='docker volume ls'
alias dvpr='docker volume prune'
alias dvrm='docker volume rm'

## Networks
alias dnet='docker network'
alias dnetc='docker network connect'
alias dnetd='docker network disconnect'
alias dneti='docker network inspect'
alias dnetl='docker network ls'
alias dnetpr='docker network prune'
alias dnetrm='docker network rm'





#ssh

rmt() {
    if [[ $1 == worker0 ]]
    then
        ssh bresnow@vverkan00den.bresnow.design -p 2546
    elif [[ $1 == storage ]]
    then
        ssh root@89.47.161.238
    elif [[ $1 == worker1 ]]
    then
        ssh bresnow@vverkan01den.bresnow.design -p 4669
    elif [[ $1 == worker2 ]]
    then
        ssh bresnow@vverkan02den.bresnow.design -p 4669
    elif [[ $1 == worker3 ]]
    then
        ssh bresnow@vverkan03den.bresnow.design -p 4669
    elif [[ $1 == lab1 ]]
    then
        ssh bresnow@lab1.floatingmammoth.io
    elif [[ $1 == lab2 ]]
    then
        ssh bresnow@lab2.floatingmammoth.io
    elif [[ $1 == lab3 ]]
    then
        ssh bresnow@lab3.floatingmammoth.io
    elif [[ $1 == lab4 ]]
    then
        ssh bresnow@lab4.floatingmammoth.io
    fi
    }
