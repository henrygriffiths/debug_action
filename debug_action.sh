#!/bin/bash

echo -e '====== Dump Contexts ======'

contexts=$(echo $1 | sed 's/[^A-Za-z,]//g' | tr '[:upper:]' '[:lower:]')

contexts_last=${contexts##*,}

for x in $(echo $contexts | tr ',' '\n')
do
    if [ $x == 'github' ]; then
        echo -e '>>>>>> GitHub Context'
        echo -e "$GITHUB_CONTEXT"
        echo -e '<<<<<< GitHub Context'
    elif [ $x == 'env' ]; then
        echo -e '>>>>>> Env Context'
        echo -e "$ENV_CONTEXT"
        echo -e '<<<<<< Env Context'
    elif [ $x == 'job' ]; then
        echo -e '>>>>>> Job Context'
        echo -e "$JOB_CONTEXT"
        echo -e '<<<<<< Job Context'
    elif [ $x == 'steps' ]; then
        echo -e '>>>>>> Steps Context'
        echo -e "$STEPS_CONTEXT"
        echo -e '<<<<<< Steps Context'
    elif [ $x == 'runner' ]; then
        echo -e '>>>>>> Runner Context'
        echo -e "$RUNNER_CONTEXT"
        echo -e '<<<<<< Runner Context'
    elif [ $x == 'secrets' ]; then
        echo -e '>>>>>> Secrets Context'
        echo -e "$SECRETS_CONTEXT"
        echo -e '<<<<<< Secrets Context'
    elif [ $x == 'strategy' ]; then
        echo -e '>>>>>> Strategy Context'
        echo -e "$STRATGEY_CONTEXT"
        echo -e '<<<<<< Strategy Context'
    elif [ $x == 'matrix' ]; then
        echo -e '>>>>>> Matrix Context'
        echo -e "$MATRIX_CONTEXT"
        echo -e '<<<<<< Matrix Context'
    elif [ $x == 'needs' ]; then
        echo -e '>>>>>> Needs Context'
        echo -e "$NEEDS_CONTEXT"
        echo -e '<<<<<< Needs Context'
    elif [ $x == 'inputs' ]; then
        echo -e '>>>>>> Inputs Context'
        echo -e "$INPUTS_CONTEXT"
        echo -e '<<<<<< Inputs Context'
    else
        echo -e '======= Context NOT FOUND ======='
    fi
    if [ ! $x == $contexts_last ]; then
        printf '\n\n\n'
    fi
done
