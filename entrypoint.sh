#!/bin/sh -l

cd $GITHUB_WORKSPACE

export RANCHER_URL="$1"
export RANCHER_ACCESS_KEY="$2"
export RANCHER_SECRET_KEY="$3"
export RANCHER_COMPOSE_FILE="$4"
export DOCKER_COMPOSE_FILE="$5"
export STACK_NAME="$6"
export ENV_FILE="$7"
export CHECK_SERVICE="$8"
export PULL_IMAGES="$9"

if [ "$PULL_IMAGES" = "true" ]; then
    rancher-compose \
        --file ${DOCKER_COMPOSE_FILE} \
        --rancher-file ${RANCHER_COMPOSE_FILE} \
        --project-name "${STACK_NAME}" \
        --env-file=${ENV_FILE} \
      pull
fi

if [ "$CHECK_SERVICE" != "" ]; then
    state=$(rancher inspect $CHECK_SERVICE | jq -r .state)

    if [ "$state" = "active" ]; then
        rancher-compose \
            --file ${DOCKER_COMPOSE_FILE} \
            --rancher-file ${RANCHER_COMPOSE_FILE} \
            --project-name "${STACK_NAME}" \
            --env-file=${ENV_FILE} \
            up -d --confirm-upgrade --force-recreate
    else
        echo "skipped=true" >> $GITHUB_OUTPUT
    fi
else
    rancher-compose \
        --file ${DOCKER_COMPOSE_FILE} \
        --rancher-file ${RANCHER_COMPOSE_FILE} \
        --project-name "${STACK_NAME}" \
        --env-file=${ENV_FILE} \
        up -d --confirm-upgrade --force-recreate
fi
