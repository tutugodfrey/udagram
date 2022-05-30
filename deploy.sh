#! /bin/bash

# common scripts to help with managing stacks

# Create vpc stack
# aws cloudformation create-stack --stack-name udagram-vpc-stack --template-body file://vpc-stack.yml
# aws cloudformation create-stack --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --stack-name udagram --template-body file://cloudformation.yml
if [[ -z $AWS_PROFILE ]]; then
  export AWS_PROFILE=udalab
fi

echo project is ${PROJECT_ENV}
if [[ -z $PROJECT_ENV ]]; then
  PROJECT_ENV=dev
fi

echo $PROJECT_ENV $AWS_PROFILE

aws cloudformation deploy --stack-name udagram-${PROJECT_ENV}-vpc-stack --template-file vpc-stack.yml --parameter-overrides Environment=${PROJECT_ENV}
aws cloudformation deploy --stack-name udagram-${PROJECT_ENV}-sg --template-file security-groups.yml --parameter-overrides Environment=${PROJECT_ENV}
aws cloudformation deploy --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --stack-name udagram-${PROJECT_ENV}-servers --template-file servers.yml --parameter-overrides Environment=${PROJECT_ENV} KeyName=udacity-devops-us-east
echo Environnment is ok