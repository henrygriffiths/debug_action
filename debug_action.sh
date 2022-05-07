#!/bin/bash

echo -e '\033[1;34m====== Dump Contexts ======\033[0m'

contexts=$(echo $1 | sed 's/[^A-Za-z,]//g' | tr '[:upper:]' '[:lower:]')

contexts_last=${contexts##*,}

for x in $(echo $contexts | tr ',' '\n')
do
    if [ $x == 'github' ]; then
        echo -e '\033[1;33m>>>>>> GitHub Context\033[0m'
        echo -e "$GITHUB_CONTEXT"
        echo -e '\033[1;33m<<<<<< GitHub Context\033[0m'
    elif [ $x == 'env' ]; then
        echo -e '\033[1;33m>>>>>> Env Context\033[0m'
        echo -e "$ENV_CONTEXT"
        echo -e '\033[1;33m<<<<<< Env Context\033[0m'
    elif [ $x == 'job' ]; then
        echo -e '\033[1;33m>>>>>> Job Context\033[0m'
        echo -e "$JOB_CONTEXT"
        echo -e '\033[1;33m<<<<<< Job Context\033[0m'
    elif [ $x == 'steps' ]; then
        echo -e '\033[1;33m>>>>>> Steps Context\033[0m'
        echo -e "$STEPS_CONTEXT"
        echo -e '\033[1;33m<<<<<< Steps Context\033[0m'
    elif [ $x == 'runner' ]; then
        echo -e '\033[1;33m>>>>>> Runner Context\033[0m'
        echo -e "$RUNNER_CONTEXT"
        echo -e '\033[1;33m<<<<<< Runner Context\033[0m'
    elif [ $x == 'secrets' ]; then
        echo -e '\033[1;33m>>>>>> Secrets Context\033[0m'
        echo -e "$SECRETS_CONTEXT"
        echo -e '\033[1;33m<<<<<< Secrets Context\033[0m'
    elif [ $x == 'strategy' ]; then
        echo -e '\033[1;33m>>>>>> Strategy Context\033[0m'
        echo -e "$STRATGEY_CONTEXT"
        echo -e '\033[1;33m<<<<<< Strategy Context\033[0m'
    elif [ $x == 'matrix' ]; then
        echo -e '\033[1;33m>>>>>> Matrix Context\033[0m'
        echo -e "$MATRIX_CONTEXT"
        echo -e '\033[1;33m<<<<<< Matrix Context\033[0m'
    elif [ $x == 'needs' ]; then
        echo -e '\033[1;33m>>>>>> Needs Context\033[0m'
        echo -e "$NEEDS_CONTEXT"
        echo -e '\033[1;33m<<<<<< Needs Context\033[0m'
    elif [ $x == 'inputs' ]; then
        echo -e '\033[1;33m>>>>>> Inputs Context\033[0m'
        echo -e "$INPUTS_CONTEXT"
        echo -e '\033[1;33m<<<<<< Inputs Context\033[0m'
    else
        echo -e '\033[1;31m======= Context NOT FOUND =======\033[0m'
    fi
    if [ ! $x == $contexts_last ]; then
        printf '\n\n\n'
    fi
done
