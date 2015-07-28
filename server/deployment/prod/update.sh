#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR
cp .ebext/* $SCRIPT_DIR/../../.ebextensions/
cp .ebconfig/* $SCRIPT_DIR/../../.elasticbeanstalk/

cd $SCRIPT_DIR/../..
eb use prod-env #Environment
eb deploy
eb open