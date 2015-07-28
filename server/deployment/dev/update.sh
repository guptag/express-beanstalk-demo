#!/usr/bin/env bash

# http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers-ec2.html#customize-containers-format-options

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR
cp .ebext/* $SCRIPT_DIR/../../.ebextensions/
cp .ebconfig/* $SCRIPT_DIR/../../.elasticbeanstalk/

cd $SCRIPT_DIR/../..
eb use dev-env  #Environment
eb deploy
eb open