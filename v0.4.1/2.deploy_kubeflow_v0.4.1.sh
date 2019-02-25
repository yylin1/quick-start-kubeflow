KUBEFLOW_SRC=mykfsrc   
mkdir ${KUBEFLOW_SRC}
cd ${KUBEFLOW_SRC}

## version 
export KUBEFLOW_TAG=v0.4.1
curl https://raw.githubusercontent.com/kubeflow/kubeflow/${KUBEFLOW_TAG}/scripts/download.sh | bash
cd ../
KUBEFLOW_REPO=$(pwd)/mykfsrc
KFAPP=mykfapp
${KUBEFLOW_REPO}/scripts/kfctl.sh init ${KFAPP} --platform none
cd ${KFAPP}
${KUBEFLOW_REPO}/scripts/kfctl.sh generate k8s
NAMESPACE=kubeflow
kubectl create ns ${NAMESPACE}
${KUBEFLOW_REPO}/scripts/kfctl.sh apply k8s

# wait deploy  
sleep 2m
kubectl -n kubeflow get pod -o wide
