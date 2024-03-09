#gitops
oc apply -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_gitops.yaml
#oc delete -f https://raw.githubusercontent.com/arslankhanali/openshift-automations/main/operators/operator_gitops.yaml

sleep 10
oc patch argocd openshift-gitops -n openshift-gitops --type merge --patch '{"spec":{"rbac":{"defaultPolicy":"role:admin"}}}'

sleep 2
echo ""
echo "https://$(oc get routes -n openshift-gitops openshift-gitops-server -o=jsonpath='{.spec.host}')"

sleep 2
echo ""
oc get secret openshift-gitops-cluster -n openshift-gitops -o=jsonpath='{.data.admin\.password}' | base64 --decode
