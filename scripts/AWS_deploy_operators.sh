# Login to oc
folder="$HOME/Codes/openshift-master"


# delete ai
# oc delete -f $folder/operators/operator_ai.yaml

#odf
oc apply -f $folder/operators/operator_odf.yaml  
sleep 30

#servicemesh - Needed for Caikit TGIS serving runtime
sleep 5
oc apply -f $folder/operators/operator_servicemesh.yaml 

#serverless - - Needed for Caikit TGIS serving runtime
sleep 5
oc apply -f $folder/operators/operator_serverless.yaml 

#nfd - tags nodes with GPUs
sleep 5
oc apply -f $folder/operators/operator_nfd.yaml

#nvidia - GPU drivers installed
sleep 5
oc apply -f $folder/operators/operator_nvidiagpu.yaml 

#pipelines
# sleep 5
# oc apply -f $folder/operators/operator_pipelines.yaml

#minio - For s3 storage
sleep 5
oc apply -f $folder/applications/minio_template.yaml

#rhoai
oc apply -f $folder/operators/operator_ai.yaml  

#operator_crds
sleep 60
oc apply -f $folder/operator_crds/nfd_nodefeaturediscovery.yaml      
oc apply -f $folder/operator_crds/nvidia_clusterpolicy.yaml
oc apply -f $folder/operator_crds/odf_storagesystem_object.yaml
sleep 10
oc apply -f $folder/operator_crds/ai_dsc.yaml

oc patch console.operator cluster -n openshift-storage --type json -p '[{"op": "add", "path": "/spec/plugins", "value": ["odf-console"]}]'

# Values
# echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"