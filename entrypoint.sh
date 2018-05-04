#!/bin/bash
set -e

# Inject SSM secrets
if [[ -n $SSM_SECRETS ]]
then
  secrets=$(aws ssm get-parameters --names $SSM_SECRETS --query 'Parameters[*].[Value]' --output text --with-decryption)
  for secret in "${secrets[@]}"
  do
    export $secret
  done
fi

# Add initialisation logic here
confd -onetime -backend env

# Run application
exec "$@"