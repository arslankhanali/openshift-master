#!/bin/bash

# Get the list of operators and their ages, excluding those with age greater than or equal to 140m
operators=$(oc get operators.operators.coreos.com --no-headers | awk '$2 < "140m" {print $1}')

# Loop through the list of operators and delete each one
while IFS= read -r operator; do
    echo "Deleting operator $operator..."
    oc delete operator $operator
done <<< "$operators"