#!/bin/bash
sshpass -p $PASSWORD ssh  -p $SSH_PORT -o StrictHostKeyChecking=no -T $DEPLOY_USER@$DEPLOY_SERVER << EOF
docker login -u $DOCKER_USERID -p $DOCKERPASSWD
docker rmi -f $DOCKER_USERID/$APP_NAME || true
docker rm -f $APP_NAME || true
docker pull $DOCKER_USERID/$APP_NAME
docker run -d -p $APP_PORT:$APP_PORT --name $APP_NAME $DOCKER_USERID/$APP_NAME
EOF
