# [PRODUCTION] REACT -> BUILD -> SSH (PEM KEY O)
WORKSPACE=${WORKSPACE}
BUILD_NUMBER=${BUILD_NUMBER}

BUILD_FILE_PATH=$WORKSPACE
BUILD_FILE_NAME=build.tar

SSH_PATH=ubuntu@[IP]
SSH_FILE_PATH=/var/www/html
SSH_PROJECT_PATH=/home/ubuntu
SSH_PEM_KEY=$WORKSPACE/up-home.pem
SSH_SCRIPT_PATH=/home/ubuntu/build_scripts

SSH_CLI='ssh -i '"$SSH_PEM_KEY "$SSH_PATH 

UNZIP_SCRIPT="$SSH_CLI "$SSH_SCRIPT_PATH/unzip_file.sh
BACKUP_SCRIPT="$SSH_CLI "$SSH_SCRIPT_PATH/backup_file.sh
REPLACE_SCRIPT="$SSH_CLI "$SSH_SCRIPT_PATH/replace_file.sh

cd $BUILD_FILE_PATH \
&& echo "=================== INIT FILE ===================" \
&& rm -rf $BUILD_FILE_PATH/build/ \
&& echo "=================== NPM INSTALL ===================" \
&& npm install \
&& echo "=================== NPM BUILD ===================" \
&& npm run build \
&& echo "=================== TRANSFER FILES ===================" \
&& tar -cvf $BUILD_FILE_NAME build/ \
&& scp -i $SSH_PEM_KEY $BUILD_FILE_NAME $SSH_PATH:$SSH_PROJECT_PATH/ \
&& echo "=================== EXEC SCRIPTS ===================" \
&& $UNZIP_SCRIPT \
&& $BACKUP_SCRIPT \
&& $REPLACE_SCRIPT