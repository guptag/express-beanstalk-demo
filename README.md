pip install awsebcli
pip install --upgrade awsebcli
aws configure

-----------------
## INITIALIZATION
-----------------
server > eb init
* copy the config.yml from .elasticbeanstalk to deployment/dev/.ebconfig/config.yml
* set environment to "dev-env"

* copy the config.yml from .elasticbeanstalk to deployment/prod/.ebconfig/config.yml
* set environment to "prod-env"


--------------------------------
## CREATE ENVIRONMENTS (ONE TIME)
---------------------------------
#dev env (enter environment = dev-env)#
server > cp deployment/dev/.ebext/*.config .ebextensions/
eb create --tags ENV=DEV,APP=DASHBOARD

#prod env (enter environment = prod-env)#
server > cp deployment/prod/.ebext/*.config .ebextensions/
eb create --tags ENV=PROD,APP=DASHBOARD


----------------------
## FURTHER DEPLOYMENTS
----------------------
#dev env#
server > deployment/dev/update.sh

#prod env (enter environment = prod-env)#
server > deployment/prod/update.sh


#### Other commands
eb create
eb deploy
eb terminate
eb open
eb config      # see the configuration of the current environment
eb list        # lists all environments
eb use dev-env # use a specific environment