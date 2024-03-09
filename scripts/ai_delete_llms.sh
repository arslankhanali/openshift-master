# Login to oc

#odf
# sleep 2
# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml  
# sleep 30

#nfd
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nfd.yaml

#nvidia
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nvidia.yaml 

#pipelines
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml

#servicemesh
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_servicemesh.yaml 

#serverless
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml 

#codeflare
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_codeflare.yaml  

#mino
sleep 2
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_minio.yaml

#ai operator
sleep 30
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_ai.yaml        

# Values
echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"