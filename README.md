# Uda-gram

Use cloudformation to deploy infrastructure as code. This is Udagram, instagram clone of Udacity

To deploy the infrastructure a convenient scripts is provided in the project directory. The only requirement to deploy to different environments is to provide your aws credential (AWS Profile) and specify the environment you want to deploy to (one of `dev`, `staging`, `prod`). You can set these values as exported environment variables as shown below, the execute the script.


```bash
export PROJECT_ENV=prod
```

```bash
export AWS_PROFILE=yourprofile
```

You can as well provide you AWS access credential a way more convenient for you

While you are in the project directory, execute the script as shown

```bash
./deploy.sh
```

**Notes:**

Conditions are set in the cloudformation template to ensure that

- When deploying the prod, the web app is deployed to a private subnet
- KeyPair is not attached to the LaunchConfiguration when deploying to prod
- We use t3.small is used for prod and t2.micro is used for dev

SSH Port 22 is open to app server only from within the VPC

Once deployed, you are able to access the application with Load Balancer DNS from the cloudformation output of the server start


The application is live and can access with the following LoadBalancer endpoint

[UdaGram](http://udagr-loadb-17p07tvhmq4qm-1300612481.us-east-1.elb.amazonaws.com/)

Good Luck!
