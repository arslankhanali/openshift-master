
```sh
#Users/arslankhan/Codes/openshift-master

# See dry run of yamls
helm template helm_workbench -s templates/dataconnection.yaml 

# deploy chart
helm install llm helm_workbench

# Apply changes in values.yaml file
helm upgrade llm helm_workbench                
```