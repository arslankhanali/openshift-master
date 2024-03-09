# Operators
1. **Notes**: To deploy operators using yaml manifests
   1. All need yamls of kind 'operator' and 'subscription'
   2. If they do not deploy in 'openshift-operators' namespace then we would also need yamls for 'namespace' and 'OperatorGroup'
      1. See difference betweeen 'serverless' and 'pipelines' operator yamls. [serverless](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml) needs 4 kinds of yamls while [pipelines](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml) just needs 2 because it installs in 'openshift-operators' by default
2. **Operators** are the mechanisms for managing the applications themselves
3. **Subscriptions** are often used for managing the lifecycle of Operators
4. **OperatorGroups**
   1. They provide relevant apis to the operator. e.g. for odf it provides apis for 
   `"BackingStore.v1alpha1.noobaa.io,BucketClass.v1alpha1.noobaa.io,CSIAddonsNode.v1alpha1.csiaddons.openshift.io,CephBlockPool.v1.ceph.rook.io,CephBlockPoolRadosNamespace.v1.ceph.rook.io,CephBucketNotification.v1.ceph.rook.io,CephBucketTopic.v1.ceph.rook.io,CephCOSIDriver.v1.ceph.rook.io,CephClient.v1.ceph.rook.io,CephCluster.v1.ceph.rook.io,CephFilesystem.v1.ceph.rook.io,CephFilesystemMirror.v1.ceph.rook.io,CephFilesystemSubVolumeGroup.v1.ceph.rook.io,CephNFS.v1.ceph.rook.io,CephObjectRealm.v1.ceph.rook.io,CephObjectStore.v1.ceph.rook.io,CephObjectStoreUser.v1.ceph.rook.io,CephObjectZone.v1.ceph.rook.io,CephObjectZoneGroup.v1.ceph.rook.io,CephRBDMirror.v1.ceph.rook.io,NamespaceStore.v1alpha1.noobaa.io,NetworkFence.v1alpha1.csiaddons.openshift.io,NooBaa.v1alpha1.noobaa.io,NooBaaAccount.v1alpha1.noobaa.io,OCSInitialization.v1.ocs.openshift.io,ObjectBucket.v1alpha1.objectbucket.io,ObjectBucketClaim.v1alpha1.objectbucket.io,ReclaimSpaceCronJob.v1alpha1.csiaddons.openshift.io,ReclaimSpaceJob.v1alpha1.csiaddons.openshift.io,StorageClassRequest.v1alpha1.ocs.openshift.io,StorageCluster.v1.ocs.openshift.io,StorageConsumer.v1alpha1.ocs.openshift.io,StorageProfile.v1.ocs.openshift.io,StorageSystem.v1alpha1.odf.openshift.io,VolumeReplication.v1alpha1.replication.storage.openshift.io,VolumeReplicationClass.v1alpha1.replication.storage.openshift.io"`
5. 
6. 
