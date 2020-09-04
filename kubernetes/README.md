## Install Kubernetes, launch a cluster and deploy

https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

* sudo apt install unzip
* curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
* unzip awscliv2.zip
* sudo ./aws/install
* aws configure 
* (aws credentials)
* curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
* sudo mv /tmp/eksctl /usr/local/bin
* eksctl version


* curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl
* chmod +x ./kubectl
* sudo mv ./kubectl /usr/local/bin
* kubectl version --short --client


eksctl create cluster \
--name rain-in-spain \
--version 1.17 \
--region us-east-2 \
--nodegroup-name linux-nodes \
--node-type t2.micro \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key <name of key pair> \
--managed

* kubectl get svc

* NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
* kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   9m27s

* kubectl create namespace rain-capstone
* kubectl apply -f rain-service.yaml
* deployment.apps/rain-in-spain-service created
* service/rain-in-spain-service created

* kubectl get all -n rain-capstone

* NAME                                         READY   STATUS    RESTARTS   AGE
* pod/rain-in-spain-service-7bfcf84d7d-8l67h   1/1     Running   0          77s
* pod/rain-in-spain-service-7bfcf84d7d-bjqhh   1/1     Running   0          77s
* pod/rain-in-spain-service-7bfcf84d7d-pmbp6   1/1     Running   0          77s

* NAME                            TYPE           CLUSTER-IP     EXTERNAL-IP                                                                                                 PORT(S)        AGE
* service/rain-in-spain-service   LoadBalancer   10.100.47.26   abd9dc3f174524072989                                                                           
* aef353c9a8cb-2109472451.us-east-2.elb.amazonaws.com   80:32346/TCP   77s

* NAME                                    READY   UP-TO-DATE   AVAILABLE   AGE
* deployment.apps/rain-in-spain-service   3/3     3            0           77s

* NAME                                               DESIRED   CURRENT   READY   AGE
* replicaset.apps/rain-in-spain-service-7bfcf84d7d   3         3         3       77s

* kubectl get svc --namespace=rain-capstone
* NAME                    TYPE           CLUSTER-IP     EXTERNAL-IP                                                               PORT(S)        AGE
* rain-in-spain-service   LoadBalancer   10.100.47.26   abd9dc3f174524072989aef353c9a8cb-2109472451.us-east-2.elb.amazonaws.com   80:32346/TCP   5h11m
