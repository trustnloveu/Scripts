# REACT -> NPM START
DEPLOY_ENV=dev
JENKINS_ITEM=${JOB_NAME}

BUILD_ROOT_PATH=/home/jenkins/workspace/
PROJECT_PATH=$BUILD_ROOT_PATH$JENKINS_ITEM
BUILD_FILE_PATH=$BUILD_ROOT_PATH$JENKINS_ITEM/build

REMOTE_SERVER=ubuntu@[IP]
REMOTE_PATH=:/home/ubuntu/[PROJECT_SOURCE]
REMOTE_SCRIPT='rm `ls *|grep -v node_modules`'
REMOTE_SCRIPT_START='npm start'

export NVM_DIR="$HOME/.nvm" # set local path to NVM
. ~/.nvm/nvm.sh             # add NVM into the Shell session

echo 'build start' \
&& cd $PROJECT_PATH \
#&& git clone git@git...git \
#&& nvm use v15.14.0 \
#&& npm install \
#&& rm -rf $PROJECT_PATH \
#&& npm run build \
&& echo 'build success' \
&& ssh $REMOTE_SERVER$REMOTE_PATH $REMOTE_SCRIPT \
&& echo 'regacy build directory delete complete' \
&& scp -r $PROJECT_PATH $REMOTE_SERVER$REMOTE_PATH \
&& echo 'deploy success' \
&& ssh $REMOTE_SERVER $REMOTE_SCRIPT_START \
&& echo 'start success'