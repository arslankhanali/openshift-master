oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_minio.yaml


echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"
