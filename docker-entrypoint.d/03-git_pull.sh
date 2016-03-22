#!/bin/bash

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$GIT_DIR/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone ${REPOSITORY} $GIT_DIR
    git checkout ${GIT_BRANCH}
else
    cd $GIT_DIR
    git checkout ${GIT_BRANCH}
    git reset --hard origin/${GIT_BRANCH}
    git pull ${REPOSITORY}
fi
