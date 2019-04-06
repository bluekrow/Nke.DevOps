#!/usr/bin/env bash
#This is a typical situation when Tiller (server side of Helm setup)
#is deployed without a service account having appropriate cluster role (cluster-admin).
#You need to fix your Helm setup first, to be able to proceed with prometheus-operator 
#installation, as described here, or by running the below commands directly one by one
echo 'Configure Helm in cluster'
#kubectl -n kube-system create sa tiller
#kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
#Create an admin role for ClusterRoleBinding, linked with google account
echo 'Link Google Account with a ClusterroleBinding'
kubectl create clusterrolebinding cluster-role-ndv --clusterrole=cluster-admin --user=ndioses@gmail.com
echo ' Execute yml files with ''kubectl apply -f traefik.yaml'''