# Capstone Udacity Cloud DevOps Engineer

[![Build Status](http://ec2-13-59-92-215.us-east-2.compute.amazonaws.com:8080/buildStatus/icon?job=Capstone_Udacity_DevOps_Engineer%2Fmaster&subject=Jenkins%20CI&style=plastic)](http://ec2-13-59-92-215.us-east-2.compute.amazonaws.com:8080/blue/organizations/jenkins/Capstone_Udacity_DevOps_Engineer/activity/)

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

## Kubernetes:
* Create a cluster
* Deploy _Docker container_ to the cluster
