oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/applications/minio_template.yaml


echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"
