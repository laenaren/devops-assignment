# DevOps Assignment

## my respomce

I had COVId in a past 2 weeks therefore I didnt published my answer.

In the real production envirinment and not the exan one I would take a better care of secutiry and monitoring.
We can use AWS Cognito to manage users' access, AWS Cloudwarch aith AWS Splunk for better log shipping monioring. Also I would use prometeus and fraphans to have insitful dash boards

The use of modules in terraform will prevent unessary code reuse. Mainly because other project would be able to access relevant module's main file and create their own resources. Same for creating better IAM policies
Enabling WAF for the load balancer would also imrove the security aspectt of the access to this load balance.
Also in real life scenario I would built different subnets. 
The dockerfile allowes to access the contenirizes application. 


Weak spots:
K8s and ingresses. 
I know that diffentt netrork policies cam protect different pods from access from outside the cluster.
The asamption in use of EKS as a k8s provider. Mainly because of it's ability for EKS automode wich should take care kubernetes maintennce and reduce team's overload . Also the decire is to be inlined with copamy standarts.
In rerms of Helm, it is included in the repo but was never tested

