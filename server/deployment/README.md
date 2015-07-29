# https://blogs.aws.amazon.com/application-management/post/Tx1YHAJ5EELY54J/Using-the-Elastic-Beanstalk-EB-CLI-to-create-manage-and-share-environment-config

. deployment/create-app.sh        #ONE TIME - Creates application in beanstalk

dev
---
. deployment/dev/create-dev.sh    #ONE TIME - Creates the environment under the application
. deployment/dev/update-dev.sh    #Everytime to refresh the code
. deployment/dev/terminate-dev.sh #ONE TIME - Terminates the environment


prod
----
. deployment/dev/create-prod.sh    #ONE TIME - Creates the environment under the application
. deployment/dev/update-prod.sh    #Everytime to refresh the code
. deployment/dev/terminate-prod.sh #Terminates the environment


--------------------------
--------------------------
MANUAL STEPS
--------------------------
-------------

pip install awsebcli
pip install --upgrade awsebcli
aws configure #set up access_key on the system

> cd server

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
server > cp deployment/dev/.ebconfig/config.yml .elasticbeanstalk/config.yml
eb create dev-env --cname dev-env-12345 --tags ENV=DEV,APP=DASHBOARD

#prod env (enter environment = prod-env)#
server > cp deployment/prod/.ebext/*.config .ebextensions/
server > cp deployment/prod/.ebconfig/config.yml .elasticbeanstalk/config.yml
eb create prod-env --cname prod-env-12345 --tags ENV=PROD,APP=DASHBOARD


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