
# cmd
oc get -n openshift-machine-api machinesets cluster-jvn94-5rlvf-worker-eu-central-1a -o yaml | oc neat >> tmp_machineset.yaml


# Changes/Updates
1. change name: replace `worker` with `gpu`. Replace in all `4 places`:
e.g.    `cluster-jvn94-5rlvf-worker-eu-central-1a` ----> `cluster-jvn94-5rlvf-gpu-eu-central-1a`

Update
1. machine.openshift.io/GPU: "1"
2. machine.openshift.io/memoryMb: "65536"
3. machine.openshift.io/vCPU: "16"
4. replicas: 1
5. instanceType: g5.4xlarge 


# For g5.12
<!-- 2. machine.openshift.io/GPU: "4"
3. machine.openshift.io/memoryMb: "196608"
4. machine.openshift.io/vCPU: "48"
5. replicas: 1
6. instanceType: g5.12xlarge  -->

# Apply
oc apply tmp_machineset.yaml

# https://aws.amazon.com/ec2/instance-types/g5/
 g5.12xlarge
  ![alt text](../images/ec2s.png)