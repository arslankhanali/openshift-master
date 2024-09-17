# deploy
folder="$HOME/Codes/openshift-master"
oc apply -f $folder/applications/minio_template.yaml

# Get route
# minio/minio123
echo "https://$(oc get routes.route.openshift.io -n minio  minio-ui -o=jsonpath='{.spec.host}' )"

# Values 
AWS_ACCESS_KEY_ID= minio
AWS_SECRET_ACCESS_KEY= minio123
AWS_S3_BUCKET= models
AWS_S3_ENDPOINT= http://minio-service.minio.svc.cluster.local:9000
AWS_DEFAULT_REGION= None

# Create data connection
# echo -n  "http://minio-service.minio.svc.cluster.local:9000" | base64
# echo -n "minio" | base64
# echo -n "minio123" | base64
# echo -n "None" | base64
# echo -n "models" | base64
cat << EOF | oc apply -f-
---
apiVersion: v1
kind: Secret
metadata:
  name: minio
  namespace: {{ .Values.namespace }}
  labels:
    opendatahub.io/dashboard: 'true'
    opendatahub.io/managed: 'true'
  annotations:
    opendatahub.io/connection-type: s3
    openshift.io/display-name: minio
type: Opaque
data:
  AWS_ACCESS_KEY_ID: bWluaW8=
  AWS_DEFAULT_REGION: Tm9uZQ==
  AWS_S3_BUCKET: bW9kZWxz
  AWS_S3_ENDPOINT: aHR0cDovL21pbmlvLXNlcnZpY2UubWluaW8uc3ZjLmNsdXN0ZXIubG9jYWw6OTAwMA==
  AWS_SECRET_ACCESS_KEY: bWluaW8xMjM=
EOF