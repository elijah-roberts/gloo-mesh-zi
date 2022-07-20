## Mgmt Cluster
gcloud container clusters create --num-nodes=4 --machine-type n2-standard-4 --node-locations us-east1-b asayah-zi-mgmt --region us-east1
kubectl config delete-context mgmt 
kubectl config rename-context gke_solo-test-236622_us-east1_asayah-zi-mgmt mgmt
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$(gcloud config get-value core/account) --context mgmt
echo "mgmt cluster created"

## West cluster (cluster 1)
gcloud container clusters create --num-nodes=4 --machine-type n2-standard-4 --node-locations us-west2-a asayah-zi-cluster1 --region us-west2
kubectl config delete-context cluster1 
kubectl config rename-context gke_solo-test-236622_us-west2_asayah-zi-cluster1 cluster1
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$(gcloud config get-value core/account) --context cluster1
echo "cluster1 created"



## East Cluster (cluster2)
gcloud container clusters create --num-nodes=4 --machine-type n2-standard-4 --node-locations us-east1-b asayah-zi-cluster2 --region us-east1
kubectl config delete-context cluster2 
kubectl config rename-context gke_solo-test-236622_us-east1_asayah-zi-cluster2 cluster2
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$(gcloud config get-value core/account) --context cluster2
echo "cluster2 created"

## Backup cluster (cluster3 - AWS)
eksctl create cluster --name asayah-zi-cluster3 --region us-west-2 
kubectl config delete-context cluster3
kubectl config rename-context adamsayah@asayah-zi-cluster3.us-west-2.eksctl.io cluster3
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$(gcloud config get-value core/account) --context cluster3
echo "cluster3 created"