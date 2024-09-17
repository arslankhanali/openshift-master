# Login to oc
folder="$HOME/Codes/openshift-master"

oc apply -f $folder/yamls/obc.yaml
sleep 5

# secrets can only have encoded values
# already encoded in base64
access_key=$(oc get secrets -n default llm -o yaml | yq -r '.data.AWS_ACCESS_KEY_ID')
secret_key=$(oc get secrets -n default llm -o yaml | yq -r '.data.AWS_SECRET_ACCESS_KEY')
# NOT encoded in base64
bucket=$(oc get cm -n default llm -o yaml | yq -r '.data.BUCKET_NAME')
endpoint="http://$(oc get cm -n default llm -o yaml | yq -r '.data.BUCKET_HOST'):80"

# Decode from base64
decoded_access_key=$(echo -n "$access_key" | base64 -d)
decoded_secret_key=$(echo -n "$secret_key" | base64 -d)

# Echoing the PLAIN values to verify
echo "AWS_ACCESS_KEY_ID=\"$decoded_access_key\""
echo "AWS_SECRET_ACCESS_KEY=\"$decoded_secret_key\""
echo "AWS_S3_BUCKET=\"$bucket\""
echo "AWS_S3_ENDPOINT=\"$endpoint\""
echo "AWS_DEFAULT_REGION=\"None\""

# Convert the values to base64 -- Secrets can only have encoded values
bucket=$(echo -n $bucket | base64)
endpoint=$(echo -n $endpoint | base64)
region=$(echo -n None | base64)

# Echoing the ENCODED values to verify
echo ""
echo "AWS_ACCESS_KEY_ID= $access_key"
echo "AWS_SECRET_ACCESS_KEY= $secret_key"
echo "AWS_S3_BUCKET= $bucket"
echo "AWS_S3_ENDPOINT= $endpoint"
echo "AWS_DEFAULT_REGION= $region"

sed -i '' -e '/^secretdata:/,/^[ ]*$/ s/^\([^#]\)/# \1/' "$folder/helm_workbench/values.yaml"  

cat >> $folder/helm_workbench/values.yaml << EOF

secretdata:
  AWS_ACCESS_KEY_ID: $access_key
  AWS_DEFAULT_REGION: $region
  AWS_S3_BUCKET: $bucket
  AWS_S3_ENDPOINT: $endpoint
  AWS_SECRET_ACCESS_KEY: $secret_key
EOF

cat >> $folder/yamls/secret.yaml << EOF

---
apiVersion: v1
kind: Secret
metadata:
  name: dc
  namespace:
  labels:
    opendatahub.io/dashboard: 'true'
    opendatahub.io/managed: 'true'
  annotations:
    opendatahub.io/connection-type: s3
    openshift.io/display-name: dc
type: Opaque
data:
  AWS_ACCESS_KEY_ID: $access_key
  AWS_DEFAULT_REGION: $region
  AWS_S3_BUCKET: $bucket
  AWS_S3_ENDPOINT: $endpoint
  AWS_SECRET_ACCESS_KEY: $secret_key
EOF