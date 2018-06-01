#!/usr/bin/env bash
set -e
cd $( cd $(dirname $0) ; pwd -P )

ENV=".env"
while getopts "e:" OPTION
do
     case $OPTION in
         e)
            ENV=$OPTARG
            shift
            shift
            ;;
         ?)
            usage
            exit
            ;;
     esac
done

[ -f $ENV ] && export $(cat $ENV | xargs) || echo "there is no .env, skip"

function usage () {
	cat <<EOS
To execute pre-defined commands with Docker.
Usage:
	$(basename $0) <Command> [args...]
Command:
EOS
	egrep -o "^\s*function.*#cmd.*" $(basename $0) | sed "s/^[ \t]*function//" | sed "s/[ \(\)\{\}]*#cmd//" \
	    | awk '{CMD=$1; $1=""; printf "\t%-16s%s\n", CMD, $0}'
}

function glide() { #cmd docker-compose run --rm glide {command}
    docker-compose run --rm glide $@
}

function init() { #cmd docker-compose run --rm glide init
    docker-compose run --rm glide init
}

function get() { #cmd docker-compose run --rm glide get {url}
    docker-compose run --rm glide get --all-dependencies -s -v $@
}

function install() { #cmd docker-compose run --rm glide install
    docker-compose run --rm glide install
}

function list() { #cmd docker-compose run --rm glide list
    docker-compose run --rm glide list
}

function update() { #cmd docker-compose run --rm glide update
    docker-compose run --rm glide update
}

function rebuild() { #cmd docker-compose run --rm glide rebuild
    docker-compose run --rm glide rebuild
}

function help() { #cmd docker-compose run --rm glide help
    docker-compose run --rm glide help
}

if [ $# -eq 0 ] ; then
	usage
else
	export COMPOSE_HTTP_TIMEOUT=600
	CMD=$1
	shift
	$CMD $@
fi
