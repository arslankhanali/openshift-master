#  <span style="color:red">OpenShift Automation </span>  
Provides bunch of yamls and scripts to `ready openshift cluster` with neccessary `operators` and `CRDs`


### <span style="color:purple"> Motivation: </span>
- Anyone can take operator installation yamls in `operators` folder and create their own `scripts or GitOps approach`. 
- Keep it simple and easy to chop/change
- I create a different script for `different env` and `usecases`. Takes me 5mins to setup a script for my needs. Have a look at `Common Usage Scenerio` below
  

> I maintain yamls for operators on best effort basis. Feel free to send PR if things go out of sync. Cheers)

##  <span style="color:red">Common Usage Scenerio </span> 
### <span style="color:blue"> 1. Problem Statement </span>  
You have `Base RHOAI on AWS` cluster in `demo.redhat` and want to experiment with GenAI usecase.  
- For that you need to install operators like:
    1. ODF
    2. NFD
    3. Nvidia
    4. ServiceMesh
    5. Serverless
    6. CodeFlare
    7. Minio

- You will also need to create CRDs like:
  1. NFD -> nodefeaturediscovery
  2. Nvidia -> clusterpolicy
  3. ODF -> storagesystem
   
> Note: RHOAI and Pipelines operator is already installed on `Base RHOAI on AWS` demo env
###  <span style="color:blue">1. Solution </span>  
Just run 1 script
```sh
# login to your cluster
oc login  

# download script
wget https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/scripts/rhpds_llm_BaseRHOAIonAWS.sh

# Change script as per your need
# Make script executable
chmod +x rhpds_llm_BaseRHOAIonAWS.sh

# Run script
./BaseRHOAIonAWS.sh
```


###  <span style="color:red">Directory Structure </span> 
   | Folder      | Function |
| ----------- | ----------- |
| applications      | yamls to deploy 3rd party apps e.g. minio       |
| crds   | yamls dependant on operators e.g. multiclusterhub for ACM      |
| operators   | yamls to deploy OpenShift operators        |
| scripts   | scripts to ready a base OpenShift cluster e.g. `scripts/rhpds_llm_BaseRHOAIonAWS.sh` can setup `BaseRHOAIonAWS` with operators for `GenAI usecase`  |
| yamls   | extra yamls for OCP e.g. MachineConfig to add GPU node       |

###  <span style="color:red">EXTRAs ( ignore ! )</span> 
1. **Notes**: To deploy operators using yaml manifests
   1. All need yamls of kind 'operator' and 'subscription'
   2. If they do not deploy in 'openshift-operators' namespace then we would also need yamls for 'namespace' and 'OperatorGroup'
      1. See difference betweeen 'serverless' and 'pipelines' operator yamls. [serverless](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml) needs 4 kinds of yamls while [pipelines](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml) just needs 2 because it installs in 'openshift-operators' by default
2. **Operators** are the mechanisms for managing the applications themselves
3. **Subscriptions** are often used for managing the lifecycle of Operators
4. **OperatorGroups**
   1. An OperatorGroup provides a way to configure and manage the behavior of operators within a Kubernetes cluster e.g. for odf it provides 
   `"BackingStore.v1alpha1.noobaa.io,BucketClass.v1alpha1.noobaa.io,CSIAddonsNode.v1alpha1.csiaddons.openshift.io,CephBlockPool.v1.ceph.rook.io,CephBlockPoolRadosNamespace.v1.ceph.rook.io,CephBucketNotification.v1.ceph.rook.io,CephBucketTopic.v1.ceph.rook.io,CephCOSIDriver.v1.ceph.rook.io,CephClient.v1.ceph.rook.io,CephCluster.v1.ceph.rook.io,CephFilesystem.v1.ceph.rook.io,CephFilesystemMirror.v1.ceph.rook.io,CephFilesystemSubVolumeGroup.v1.ceph.rook.io,CephNFS.v1.ceph.rook.io,CephObjectRealm.v1.ceph.rook.io,CephObjectStore.v1.ceph.rook.io,CephObjectStoreUser.v1.ceph.rook.io,CephObjectZone.v1.ceph.rook.io,CephObjectZoneGroup.v1.ceph.rook.io,CephRBDMirror.v1.ceph.rook.io,NamespaceStore.v1alpha1.noobaa.io,NetworkFence.v1alpha1.csiaddons.openshift.io,NooBaa.v1alpha1.noobaa.io,NooBaaAccount.v1alpha1.noobaa.io,OCSInitialization.v1.ocs.openshift.io,ObjectBucket.v1alpha1.objectbucket.io,ObjectBucketClaim.v1alpha1.objectbucket.io,ReclaimSpaceCronJob.v1alpha1.csiaddons.openshift.io,ReclaimSpaceJob.v1alpha1.csiaddons.openshift.io,StorageClassRequest.v1alpha1.ocs.openshift.io,StorageCluster.v1.ocs.openshift.io,StorageConsumer.v1alpha1.ocs.openshift.io,StorageProfile.v1.ocs.openshift.io,StorageSystem.v1alpha1.odf.openshift.io,VolumeReplication.v1alpha1.replication.storage.openshift.io,VolumeReplicationClass.v1alpha1.replication.storage.openshift.io"`
   
