#!/bin/bash

#Execute terraform init
terraform init

if [[ ${?} -eq 1 ]]
then
   terraform init -reconfigure
fi

#Execute terraform plan
terraform plan


#Execute terraform apply
terraform apply --auto-approve

