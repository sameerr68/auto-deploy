#!/bin/bash
set -e

AWS_REGION="us-east-1"
ECR_URI="518481636301.dkr.ecr.us-east-1.amazonaws.com/my-app"

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URI

docker pull $ECR_URI:latest

docker stop day26-container || true
docker rm day26-container || true

docker run -d --name day26-container -p 80:80 $ECR_URI:latest
