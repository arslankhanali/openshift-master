# Login to oc

#odf
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_odf.yaml  

#nfd
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_nfd.yaml

#nvidia
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_nvidia.yaml 

#servicemesh
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_servicemesh.yaml 

#serverless
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_serverless.yaml 

#codeflare
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_codeflare.yaml  

#mino
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_minio.yaml

#ai operator
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_ai.yaml        

# Values
echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"