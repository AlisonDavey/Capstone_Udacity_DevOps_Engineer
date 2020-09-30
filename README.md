# Capstone Udacity Cloud DevOps Engineer

## Capstone project for Udacity Cloud DevOps Engineer nanodegree
Phase 2 of the Bertelsmann Cloud Track Scholarship Challenge 2020

Develops a CI/CD pipeline for a Jupyter notebook showing historic data for rainfall in Spain with rolling deployment.

### Linting:
 * within the notebook the .py of the notebook is checked with 'pylint'
 * the _Dockerfile_ is checked with 'hadolint'

### Jenkins Pipeline:
* The _Dockerfile_ is checked with 'hadolint'
* The _Docker container_ of the notebook and data is built.
* The _Docker container_ is pushed to docker hub.
* The _Docker container_ is deployed to a small Kubernetes cluster.
* The _Docker_ system is pruned.

### Kubernetes:
* Create a cluster using AWS EKS
* Deploy _Docker container_ to the cluster

Completed 5 September 2020 [Certificate](https://confirm.udacity.com/UJC5DELF)
