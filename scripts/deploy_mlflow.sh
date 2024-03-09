# oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_odf.yaml
# sleep 60

oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_crunchy.yaml
sleep 30

oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/mlflow/mlflow_template.yaml

echo "https://$(oc get routes release-name-mlflow-server -n mlflow -o=jsonpath='{.spec.host}')"

