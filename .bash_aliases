
alias bashrc='source $HOME/.bashrc'

alias la='ls -alh --group-directories-first'
alias ll='ls -lh --group-directories-first'

alias back='cd -'

# Update Joplin
alias update-joplin='wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash'

#alias 7z='p7zip'
alias python='python3'
alias pipenv='python3 -m pipenv'

# Docker commands
#alias postgres='docker start postgres && docker exec -it postgres /bin/bash'
alias postgres='docker run --rm -d --name postgres -e POSTGRES_USERNAME=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -v $PWD:$HOME postgres:13-alpine && docker exec -it postgres bin/bash'
alias liquibase='docker run --rm -u 1000:1000 --network="host" -v $PWD:/liquibase/changelog liquibase/liquibase'
alias psql='docker run --rm -it --network="host" -v $PWD:/tmp postgres:13-alpine psql'
alias pg_dump='docker run --rm -it -v $PWD:/tmp postgres:13-alpine pg_dump'

# Python virtual environments
alias list-venv='ls $HOME/Virtualenv'

# function to rollback apt-get upgrades
# from https://unix.stackexchange.com/questions/79050/can-i-rollback-an-apt-get-upgrade-if-something-goes-wrong
function apt-history(){
    case "$1" in
      install)
            cat /var/log/dpkg.log | grep 'install '
            ;;
      upgrade|remove)
            cat /var/log/dpkg.log | grep $1
            ;;
      rollback)
            cat /var/log/dpkg.log | grep upgrade | \
                grep "$2" -A10000000 | \
                grep "$3" -B10000000 | \
                awk '{print $4"="$5}'
            ;;
      *)
            cat /var/log/dpkg.log
            ;;
    esac
}

