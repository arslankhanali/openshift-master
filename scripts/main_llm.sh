# Tested on "Red Hat OpenShift Service on AWS" env

folder="$HOME/Codes/openshift-master"

bash $folder/scripts/addgpu_aws_g5.4xlarge.sh

# Deploy Operators
bash $folder/scripts/AWS_deploy_operators.sh

# Create OBC and use the values to create Data connection for the workbench
bash $folder/scripts/s3_noobaa.sh

# To use Nvidia GPU
oc apply -f $folder/yamls/ai_acceleratorprofile.yaml

# Expand default Pvc size to 100Gb and enable single model serving
oc apply -f $folder/yamls/ai_odhdashboardconfig.yaml
oc delete pods -l app=rhods-dashboard -n redhat-ods-applications

helm install llm $folder/helm_workbench

