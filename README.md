# DevOps Assignment

## my respomce

I had COVId in a past 2 weeks therefore I didnt published my answer.

In the real production envirinment and not the exan one I would take a better care of secutiry and monitoring.
We can use AWS Cognito to manage users' access, AWS Cloudwarch aith Splunk for better log shipping monioring. Also I would use prometeus and fraphans to have insitful dash boards

The use of modules in terraform will prevent unessary code reuse. Mainly because other project would be able to access relevant module's main file and create their own resources. Same for creating better IAM policies
Enabling WAF for the load balancer would also imrove the security aspectt of the access to this load balance.
Also in real life scenario I would built different subnets. 
The dockerfile allowes to access the contenirizes application. 


Weak spots:
K8s and ingresses. 
I know that diffentt netrork policies cam protect different pods from access from outside the cluster.
The asamption in use of EKS as a k8s provider. Mainly because of it's ability for EKS automode wich should take care kubernetes maintennce and reduce team's overload . Also the decire is to be inlined with copamy standarts.
In rerms of Helm, it is included in the repo but was never tested

** notes

to connect to ECR repo
```
aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-west-1.amazonawsom
```
from the folder with the dockerfile run:


```
docker build -t my-image:latest .
docker tag my-image:latest <account-id>.dkr.ecr.us-west-2.amazonaws.com/my-repository:latest
docker push <account-id>.dkr.ecr.us-west-2.amazonaws.com/my-repository:latest
```

# connect to the cluster
 aws ecr get-login-password --region eu-west-1 | kubectl create secret docker-registry ecr-secret --docker-server=162338488681.dkr.ecr.eu-west-1.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password --region eu-west-1) -n default

To create the correct directoty stractue:
helm create mytomorrow-chart

