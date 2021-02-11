#!/bin/bash -ex

STACK_NAME=${1:-data-science-dev-env}
REGION=${2:-ap-southeast-1}
PROFILE=${3:-default}

deploy () {

  local CMD="aws cloudformation --region=${REGION} profile=${PROFILE}"
          
  ${CMD} deploy \
  --stack-name ${STACK_NAME} \
  --template-file ./templates/ec2.yml \
  --parameter-overrides $(cat config/deploy.ini) UserData=$(base64 aml2userdata.sh) \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM CAPABILITY_AUTO_EXPAND
}

deploy
