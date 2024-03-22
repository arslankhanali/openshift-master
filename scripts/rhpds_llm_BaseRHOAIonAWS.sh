# Login to oc

#odf
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml  
sleep 30

#nfd - tags nodes with GPUs
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nfd.yaml

#nvidia - tags nodes with GPUs and utilize them
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nvidiagpu.yaml 

# #pipelines
# sleep 2
# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml

#servicemesh - Needed for Caikit TGIS serving runtime
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_servicemesh.yaml 

#serverless - - Needed for Caikit TGIS serving runtime
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml 

#codeflare - For Ray
sleep 10
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_codeflare.yaml  

#minio - For s3 storage
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/applications/minio_template.yaml

#crds
sleep 10
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/nfd_nodefeaturediscovery.yaml      
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/nvidia_clusterpolicy.yaml
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/odf_storagesystem.yaml
oc patch console.operator cluster -n openshift-storage --type json -p '[{"op": "add", "path": "/spec/plugins", "value": ["odf-console"]}]'

# Noobaa
# odf_storagesyatem should create noobaa. Takes time like 10 mins. Run below if it does not. 
# sleep 60
# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/odf_noobaa.yaml

# ai operator
# sleep 30
# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_ai.yaml  

# Values
echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"