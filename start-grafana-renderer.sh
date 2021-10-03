#!/usr/bin/env bash

. versions.sh
VERSION="$GRAFANA_RENDERER_VERSION"
DOCKER_PARAM=""
GRAFANA_NAME="agrafrender"
BIND_ADDRESS=""
GRAFANA_RENDPORT="8081"

usage="$(basename "$0") [-h] [-D encapsulate docker param] -- Start the grafana render container"
LIMITS=""
for arg; do
    shift
    if [ -z "$LIMIT" ]; then
        case $arg in
            (--limit)
                LIMIT="1"
                ;;
            (*) set -- "$@" "$arg"
                ;;
        esac
    else
        DOCR=`echo $arg|cut -d',' -f1`
        VALUE=`echo $arg|cut -d',' -f2-|sed 's/#/ /g'`
        NOSPACE=`echo $arg|sed 's/ /#/g'`
        if [ -z ${DOCKER_LIMITS[$DOCR]} ]; then
            DOCKER_LIMITS[$DOCR]=""
        fi
        DOCKER_LIMITS[$DOCR]="${DOCKER_LIMITS[$DOCR]} $VALUE"
        LIMITS="$LIMITS --limit $NOSPACE"
        unset LIMIT
    fi
done
while getopts ':hlg:D:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    l) DOCKER_PARAM="$DOCKER_PARAM --net=host"
       ;;
    D) DOCKER_PARAM="$DOCKER_PARAM $OPTARG"
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

if [ "`id -u`" -ne 0 ]; then
    GROUPID=`id -g`
    USER_PERMISSIONS="-u $UID:$GROUPID"
fi

if [[ ! $DOCKER_PARAM = *"--net=host"* ]]; then
    PORT_MAPPING="-p $GRAFANA_RENDPORT:8081"
fi

docker run ${DOCKER_LIMITS["grafanarender"]} -d $DOCKER_PARAM -i $USER_PERMISSIONS $PORT_MAPPING \
     --name $GRAFANA_NAME grafana/grafana-image-renderer:$VERSION
