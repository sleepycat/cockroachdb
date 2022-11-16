#################################################################################
# GLOBALS                                                                       #
#################################################################################
SHELL := /usr/bin/bash

project = cockroachdb-368423
name = cockroachdb
region = northamerica-northeast1

user != gcloud info --format="value(config.account)"

.PHONY: cluster
cluster:
		gcloud container clusters create "$(name)" --project "$(project)" --machine-type e2-standard-4 --region "$(region)" --num-nodes "1"

.PHONY: apply
apply:
		kubectl apply -k .

.PHONY: cluster-admin
cluster-admin:
		kubectl create clusterrolebinding "$(user)-cluster-admin-binding" --clusterrole=cluster-admin --user="$(user)"

# For debugging... assumes `pip install yq` has happened
.PHONY: print-ingressgateway-service
print-ingressgateway-service:
		kustomize build | yq -y '. | select(.kind == "CrdbCluster" and .metadata.name == "cockroachdb")'


