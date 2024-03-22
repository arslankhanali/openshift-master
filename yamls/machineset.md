
# cmd
oc get -n openshift-machine-api machinesets cluster-jvn94-5rlvf-worker-eu-central-1a -o yaml | oc neat >> tmp_machineset.yaml

# Changes
1. change name: replace `worker` with `gpu and` replace in all `4 places`:
e.g.    `cluster-jvn94-5rlvf-worker-eu-central-1a` ----> `cluster-jvn94-5rlvf-gpu-eu-central-1a`

2. machine.openshift.io/GPU: "4"
3. machine.openshift.io/memoryMb: "196608"
4. machine.openshift.io/vCPU: "48"
5. replicas: 1
6. instanceType: g5.xlarge 
 


# Apply
oc apply tmp_machineset.yaml

# https://aws.amazon.com/ec2/instance-types/g5/
 g5.12xlarge