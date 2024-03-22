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
Just run `./BaseRHOAIonAWS.sh` script
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

###  <span style="color:red">Notes</span> 
1. To deploy operators using yamls
   1. All operators need yamls of kind `operator` and `subscription`
   2. If they do not deploy in `openshift-operators` namespace then we would also need yamls for `namespace` and `OperatorGroup`
      1. See difference betweeen `serverless` and `pipelines` operator yamls. [serverless](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_serverless.yaml) needs 4 kinds of yamls while [pipelines](https://raw.githubusercontent.com/arslankhanali/openshift-helper/main/operators/operator_pipelines.yaml) just needs 2 because it installs in `openshift-operators` by default
2. **Operators:** are the mechanisms for managing the applications themselves
3. **Subscriptions:** are often used for managing the lifecycle of Operators
4. **OperatorGroups:**
   1. An OperatorGroup provides a way to configure and manage the behavior of operators within a Kubernetes cluster 