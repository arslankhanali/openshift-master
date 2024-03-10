# In the works

# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml
# sleep 60

oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_crunchy.yaml
sleep 30

oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/applications/mlflow_template.yaml
# oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/applications/mlflow_template.yaml

echo "https://$(oc get routes mlflow-mlflow-server -n mlflow -o=jsonpath='{.spec.host}')"

