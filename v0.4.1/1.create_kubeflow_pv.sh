# create kubeflow pv
#!/bin/bash

nfs_server_ip=xxx.xxx.xxx.xxx

for i in $(seq 1 3); do
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: PersistentVolume
metadata:
    name: kubeflow-pv${i}
spec:
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  nfs:
    server: ${nfs_server_ip}
    path: /nfs-data/kubeflow-pv
EOF
 done
