#!/usr/bin/env bash

# http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers-ec2.html#customize-containers-format-options

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVER_DIR="$(cd $SCRIPT_DIR/../.. && pwd)"
ENV="dev-env"

cd $SERVER_DIR

cp $SCRIPT_DIR/.ebext/* $SERVER_DIR/.ebextensions/
cp $SCRIPT_DIR/.ebconfig/* $SERVER_DIR/.elasticbeanstalk/

eb use $ENV
eb deploy
eb open