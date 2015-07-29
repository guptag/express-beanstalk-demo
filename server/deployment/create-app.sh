SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVER_DIR="$(cd $SCRIPT_DIR/.. && pwd)"

#echo $SERVER_DIR

cd $SERVER_DIR

rm -rf $SERVER_DIR/.ebextensions/*.config
rm $SERVER_DIR/.elasticbeanstalk/config.yml

eb init myexpress-demo --keyname aws-express-demo-eb --platform Node.js --region us-west-2

cp $SERVER_DIR/.elasticbeanstalk/config.yml $SCRIPT_DIR/dev/.ebconfig/config.yml #dev
cp $SERVER_DIR/.elasticbeanstalk/config.yml $SCRIPT_DIR/prod/.ebconfig/config.yml #prod