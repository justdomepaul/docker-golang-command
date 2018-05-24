#!/usr/bin/env bash
set -e
cd $( cd $(dirname $0) ; pwd -P )
[ -f .env ] && export $(cat .env | xargs) || echo "there is no .env, skip"

function usage () {
	cat <<EOS
To execute pre-defined commands with Docker.
Usage:
	$(basename $0) <Command> [args...]
Command:
EOS
	egrep -o "^\s*function.*#cmd.*" $(basename $0) | sed "s/^[ \t]*function//" | sed "s/[ \t\(\)\{\}]*#cmd//" \
	    | awk '{CMD=$1; $1=""; printf "\t%-16s%s\n", CMD, $0}'
}

function glide() { #cmd docker-compose run glide {command}
    docker-compose run glide $@
}

function init() { #cmd docker-compose run glide init
    docker-compose run glide init
}

function get() { #cmd docker-compose run glide get {url}
    docker-compose run glide get $@
}

function install() { #cmd docker-compose run glide install
    docker-compose run glide install
}

function list() { #cmd docker-compose run glide list
    docker-compose run glide list
}

function update() { #cmd docker-compose run glide update
    docker-compose run glide update
}

function rebuild() { #cmd docker-compose run glide rebuild
    docker-compose run glide rebuild
}

function help() { #cmd docker-compose run glide help
    docker-compose run glide help
}

if [ $# -eq 0 ] ; then
	usage
else
	export COMPOSE_HTTP_TIMEOUT=600
	CMD=$1
	shift
	$CMD $@
fi
