# CockroachDB on Kubernetes

This project is all about getting a reasonable cockroachdb cluster setup with a single GKE cluster.

## Running it
Change the variables at the top of the Makefile to fit your project and then run the following commands:

```sh
make cluster 
make apply
```

## Notes:
* CRD details are available only in the [code](https://github.com/cockroachdb/cockroach-operator/blob/f476ff308a53205512cf64ab70b8fb22748b0aae/config/crd/bases/crdb.cockroachlabs.com_crdbclusters.yaml)
* It looks like cockroach roughly follows the [convention for creating users](https://github.com/cockroachdb/cockroach/blob/af18b5d2f8ec09d6f3c3092be9ef5fe3f460724d/build/deploy/cockroach.sh#L155-L169) that [postgres does](https://hub.docker.com/_/postgres#:~:text=separate%20environment%20variable.-,POSTGRES_USER,-This%20optional%20environment).
* It looks like you can set those env vars via the operator with [spec.podEnvVariables](https://github.com/cockroachdb/cockroach-operator/blob/f476ff308a53205512cf64ab70b8fb22748b0aae/config/crd/bases/crdb.cockroachlabs.com_crdbclusters.yaml#L1027-L1125)
