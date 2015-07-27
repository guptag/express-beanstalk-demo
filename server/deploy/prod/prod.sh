#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR
cp .ebextensions/* $SCRIPT_DIR/../../.ebextensions/
cp .elasticbeanstalk/* $SCRIPT_DIR/../../.elasticbeanstalk/

cd $SCRIPT_DIR/../..
eb use prod-env
eb deploy
eb open