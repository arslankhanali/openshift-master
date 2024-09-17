#!/bin/bash
# https://aws.amazon.com/ec2/instance-types/g5/
# Add a A10 Nvidia GPU worker node
# Define variables
################################
gpu_value="1"
memoryMb_value="65536"
vCPU_value="16"
replicas_value="1"
instanceType_value="g5.4xlarge"
# Define the name of the temporary YAML file
tmp_yaml_file="tmp_machineset.yaml"
################################

# Get the name of the machineset dynamically
machineset_name=$(oc get -n openshift-machine-api machinesets -o jsonpath='{.items[0].metadata.name}')

# Get YAML and redirect to the temporary file
oc get -n openshift-machine-api machinesets "$machineset_name" -o yaml | oc neat > "$tmp_yaml_file"

# Replace 'worker' with 'gpu' in all occurrences in the file
sed -i '' "/$machineset_name/s/worker/gpu/g" "$tmp_yaml_file"

# Update values in the YAML file using variables
sed -i '' "s/machine.openshift.io\/GPU.*/machine.openshift.io\/GPU: \"$gpu_value\"/" "$tmp_yaml_file" 

sed -i '' "s/machine.openshift.io\/memoryMb.*/machine.openshift.io\/memoryMb: \"$memoryMb_value\"/" "$tmp_yaml_file"

sed -i '' "s/machine.openshift.io\/vCPU.*/machine.openshift.io\/vCPU: \"$vCPU_value\"/" "$tmp_yaml_file"

sed -i '' "s/replicas.*/replicas: $replicas_value/" "$tmp_yaml_file"

sed -i '' "s/instanceType.*/instanceType: $instanceType_value/" "$tmp_yaml_file"

# Print the modified lines with updated values
echo "Modified lines with updated values:"
sed -n '/machine.openshift.io\/GPU/p; /machine.openshift.io\/memoryMb/p; /machine.openshift.io\/vCPU/p; /replicas/p; /instanceType/p' "$tmp_yaml_file"

# Apply changes
oc apply -f "$tmp_yaml_file"


# Clean up temporary file
# rm "$tmp_yaml_file"