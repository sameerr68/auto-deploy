#!/bin/bash
set -e

AWS_REGION="us-east-1"
ECR_URI="518481636301.dkr.ecr.us-east-1.amazonaws.com/my-app"

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin 518481636301.dkr.ecr.us-east-1.amazonaws.com/my-app

docker pull 518481636301.dkr.ecr.us-east-1.amazonaws.com/my-app:latest

docker stop day26-container || true
docker rm day26-container || true

docker run -d --name day26-container -p 80:80 518481636301.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
