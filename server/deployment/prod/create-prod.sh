#!/usr/bin/env bash

# http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers-ec2.html#customize-containers-format-options

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVER_DIR="$(cd $SCRIPT_DIR/../.. && pwd)"
RAND=$[ 6934783 + $RANDOM % 130023343 ]
ENV="prod-env"

cd $SERVER_DIR

cp $SCRIPT_DIR/.ebext/*.config $SERVER_DIR/.ebextensions/
cp $SCRIPT_DIR/.ebconfig/config.yml $SERVER_DIR/.elasticbeanstalk/

eb create $ENV --cname $ENV-$RAND --tags ENV=DEV,APP=DASHBOARD --nohang

cp $SERVER_DIR/.elasticbeanstalk/config.yml $SCRIPT_DIR/.ebconfig/config.yml

eb open $ENV

echo "Creating "$ENV"..refresh the page in couple of minutes.."