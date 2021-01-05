##### DevOps Assignment

## __________________________________________________________________________

* What is your proudest achievement? It can be a personal project or something you have worked on professionally. Just a short paragraph is fine, but we would love to know why you are proud of it.

    #### > 
    I would describe my proudest achievement, in my professional life, when I was called in to lead a team, which I was already part of, but in abscence of the currect team leader. It was a team of 4 in cluing the currect team leader. We became a team of 3 helping our client to migrate Application and DBs to AWS cloud, that was remotely from India. I being well aware of my responsibilties and worked out effectively and was also asked by my client to come to Germany and work with them closely. We completed the project successfully and was well praised for that. 
    I am proud of this because, I could gain confidence of my client quickly and did not put his confidence down. Project work was also completed within timeline and well versed. 


* Tell us about a technical book or article you read recently, why you liked it and why we should read it as well.

    #### > Not recently but I try to follow the philosofy of the Opensource organisation, you can find it here : https://suckless.org/philosophy/
    I like the philosophy behind the work, keep stuffs simple yet functional.
    I believe computer science is ment for everyone to adopt and making things simple will attract more people and hence more ideas and more directions to solution.

## __________________________________________________________________________


High Level Outcome: - Enable us to launch a new microservice(s) in Kubernetes on a highly available and load balanced public cloud environment (eg: AWS) from scratch.
Problem statement: - Assuming that the highly available and load balanced cloud environment and Kubernetes cluster exists, you are required to automate the deployment pipeline using Jenkins to containerize and deploy the application to Kubernetes. - (Optional) Bonus points, if you are able to automate the highly available and load balanced cloud environment and Kubernetes cluster creation.
You are provided with: - A java microservice application. To run the application, executejava -jar helloworld.jar . The application will be available on TCP port 8080. The application also exposes a health check endpoint at the route   . The application can be downloaded from https://upday-
.
What is expected: - Use of infrastructure as code tools to (eg: Ansible/Terraform/Packer/Pulumi/Jenkinsfile/k8s manifests) to package, deploy and run the application. - We expect a production ready setup. A non-exhaustive list: Ensuring that application is started before it is served with traffic, node affinity/pinning, horizontal pod autoscalers, pod disruption budgets, running applications as non-root, offload TLS at the loadbalancer/ingress. Incorporate at least 4 items in this list, Bonus points, if implementing all the items in the list. - All the scripts, configs, playbooks, manifests etc. in a publicly visible DVCS (eg: GitHub). - A concise README on the Strategy/Architecture along with instructions to recreate the setup.
## __________________________________________________________________________

##### Answer:

###### Steps:
* Build the Docker image with the provided jar file.
* Push it to a Container repository (hub.docer.com in my case)
* Create the Terraform to build the folling:
    * VPC with Private and Public Subnets (NAT Gateway, Internet Gateway, Route Table)
    * EKS Cluster with Auto Scalling Group
    * Kubernetes Deployment and Service type Loadbalancer. 

###### Assumptions:
* AWS Account and IAM role configured in a Terraformer Machine.

###### Usage:
* Clone the repo and change directory to the repo.
* Run the below: 

```
cd kubernetes/cloud/amazon/terraform

terraform init

terraform plan
terraform apply -auto-approve
```

###### What we deployed

```
# grab our EKS config
aws eks update-kubeconfig --name upday-eks-cluster --region ap-south-1 --profile xxx

kubectl get nodes
kubectl get deploy
kubectl get pods
kubectl get svc
``` 

###### Cleanup

```
terraform destroy --auto-approve
```
