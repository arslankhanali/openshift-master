oc get subscriptions.operators.coreos.com -A
oc get operators.operators.coreos.com -A

# Namespace
kind="namespace"
name="openshift-operators"

oc get $kind $name -o yaml | oc neat

# Subscription 
kind="subscriptions"
namespace="openshift-operators"
name="cluster-observability-operator"

oc get -n $namespace $kind $name -o yaml | oc neat

# Operator
kind="operators"
name="cluster-observability-operator.openshift-operators"
oc get $kind $name -o yaml | oc neat

#