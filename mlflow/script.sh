oc new-project mlfow
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/mlflow/mlflow_template.yaml
echo "https://$(oc get routes release-name-mlflow-server -n mlflow -o=jsonpath='{.spec.host}')"

