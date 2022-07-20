gcloud container clusters delete asayah-zi-mgmt --region us-east1 --quiet
gcloud container clusters delete asayah-zi-cluster1 --region us-west2 --quiet
gcloud container clusters delete asayah-zi-cluster2 --region us-east1 --quiet
eksctl delete cluster --name asayah-zi-cluster3 --region us-west-2