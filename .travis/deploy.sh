#!/bin/bash
rsync -r --delete-after --quiet $TRAVIS_BUILD_DIR/ $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
#rsync -r --delete-after --quiet -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" $TRAVIS_BUILD_DIR/ $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH #discouraged to apply
