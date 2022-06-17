#!/bin/bash
#
# script to query dynamoDB using aws cli


# list all tables
aws dynamodb list-tables --color on \
  | grep --invert-match 'cndx-liquidity-x-dev' \
  | grep --invert-match 'cndx-exchange-x-dev' \
  | awk '{print $2}' \
  | while read -r TABLE; do
    # table count
    COUNT=$(aws dynamodb scan --table-name $TABLE --select "COUNT" | awk '{print $2}')
    echo -e "$COUNT\t$TABLE" | column --table --separator $'\x1d'
      # | awk -v OFS='\t' '{print "$TABLE", $0}'
  done

# query based on primary key
aws dynamodb query --table-name cndx-b2c-x-dev --key-condition-expression "Artist = :v1"

aws dynamodb scan --table-name cndx-b2c-x-dev --expression-attribute-values '{":CUSTOMER_ID": {"S": "c8063dcc-cbce-40ef-8d96-6407ebac573a"}}'

aws cognito-idp list-users --user-pool-id eu-central-1_VDcZ2RY3e
# https://serverless-stack.com/chapters/create-a-cognito-test-user.html

aws dynamodb execute-statement --statement "SELECT * FROM cndx-b2c-x-dev"

# Cognito
aws cognito-idp list-users --user-pool-id eu-central-1_VDcZ2RY3e | grep -i users
aws cognito-idp list-users --user-pool-id eu-central-1_VDcZ2RY3e | grep -i users | wc
aws cognito-idp admin-get-user --user-pool-id eu-central-1_VDcZ2RY3e --username wepitaf572@tdcryo.com
aws cognito-idp admin-set-user-password --user-pool-id <your user pool id> --username user1 --password password --permanent
aws cognito-idp admin-update-user-attributes --user-pool-id *** --username *** --user-attributes '[{"Name": "email_verified", "Value": "true"}]'
