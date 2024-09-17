oc delete pods -l app=rhods-dashboard -n redhat-ods-applications

oc patch odhdashboardconfig/odh-dashboard-config -p '{"spec":{"notebookController": {"pvcSize":"100Gi"}}}' --type merge