# Login to oc

#odf
# sleep 2
# oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml  
# sleep 30

#nfd - tags nodes with GPUs
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nfd.yaml

#nvidia - tags nodes with GPUs and utilize them
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_nvidiagpu.yaml 

#pipelines
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml

#servicemesh - Needed for Caikit TGIS serving runtime
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_servicemesh.yaml 

#serverless - - Needed for Caikit TGIS serving runtime
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml 

#codeflare - For Ray
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_codeflare.yaml  

#minio - For s3 storage
sleep 2
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_minio.yaml

#ai operator
sleep 30
oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_ai.yaml        

# Values
echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"