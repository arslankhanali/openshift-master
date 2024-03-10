#odf
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml  
sleep 60


oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/odf_storagesystem.yaml
# 3xworkers m5.8xlarge 32 cores 124Gb memory
#oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/crds/odf_storagecluster.yaml


oc patch console.operator cluster -n openshift-storage --type json -p '[{"op": "add", "path": "/spec/plugins", "value": ["odf-console"]}]'

oc delete pod -n openshift-console -l component=ui