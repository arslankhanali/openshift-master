# Get the output of the command and store it in a variable
route_url="https://$(oc get routes release-name-mlflow-server -n mlflow -o=jsonpath='{.spec.host}')"

# Replace the placeholder in the file with the actual URL
sed -i '' "s|  href: ''|  href: '${route_url}'|g" '/Users/arslankhan/Codes/0-scripts/Templates/mlflow/consolelink.yaml'

oc apply -f '/mlflow/consolelink.yaml'