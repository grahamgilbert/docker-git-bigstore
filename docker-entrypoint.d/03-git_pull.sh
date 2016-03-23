#!/bin/bash

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$TARGET_DIR/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone ${REPOSITORY} $TARGET_DIR
    git checkout ${GIT_BRANCH}
else
    cd $GIT_DIR
    git checkout ${GIT_BRANCH}
    git reset --hard origin/${GIT_BRANCH}
    git pull ${REPOSITORY}
fi
