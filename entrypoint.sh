#!/bin/sh -l

cd $GITHUB_WORKSPACE

export RANCHER_URL="$1"
export RANCHER_ACCESS_KEY="$2"
export RANCHER_SECRET_KEY="$3"
export RANCHER_COMPOSE_FILE="$4"
export DOCKER_COMPOSE_FILE="$5"
export STACK_NAME="$6"
export ENV_FILE="$7"

rancher-compose \
    --file ${DOCKER_COMPOSE_FILE} \
    --rancher-file ${RANCHER_COMPOSE_FILE} \
    --project-name "${STACK_NAME}" \
    --env-file=${ENV_FILE} \
    up -d --confirm-upgrade --force-recreate
