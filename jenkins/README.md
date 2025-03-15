```shell
$ helm search repo jenkins
NAME             	CHART VERSION	APP VERSION	DESCRIPTION                                       
bitnami/jenkins  	13.5.7       	2.492.2    	Jenkins is an open source Continuous Integratio...
jenkinsci/jenkins	5.8.18       	2.492.2    	Jenkins - Build great things at any scale! As t...
```

```shell
$ helm install jenkins jenkins/jenkins -f override.yaml 
NAME: jenkins
LAST DEPLOYED: Thu Mar 13 15:31:12 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get your 'admin' user password by running:
  kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  echo http://127.0.0.1:8080
  kubectl --namespace default port-forward svc/jenkins 8080:8080

3. Login with the password from step 1 and the username: admin
4. Configure security realm and authorization strategy
5. Use Jenkins Configuration as Code by specifying configScripts in your values.yaml file, see documentation: http://127.0.0.1:8080/configuration-as-code and examples: https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos

For more information on running Jenkins on Kubernetes, visit:
https://cloud.google.com/solutions/jenkins-on-container-engine

For more information about Jenkins Configuration as Code, visit:
https://jenkins.io/projects/jcasc/


NOTE: Consider using a custom image with pre-installed plugins
```


jenkins@default-8v9pn:~/agent$ pwd
/home/jenkins/agent

```shell
jenkins@default-8v9pn:~/agent$ java -jar jenkins-cli.jar -s http://jenkins:8080/ help

ERROR: You must authenticate to access this Jenkins.
Jenkins CLI
Usage: java -jar jenkins-cli.jar [-s URL] command [opts...] args...
Options:
 -s URL              : the server URL (defaults to the JENKINS_URL env var)
 -webSocket          : connect using WebSocket (the default; works well with most reverse proxies; requires Jetty)
 -http               : use a pair of HTTP(S) connections rather than WebSocket
 -ssh                : use SSH protocol rather than WebSocket (requires -user; SSH port must be open on server)
 -i KEY              : SSH private key file used for authentication (for use with -ssh)
 -noCertificateCheck : bypass HTTPS certificate check entirely. Use with caution
 -noKeyAuth          : do not try to load the SSH authentication private key. Conflicts with -i
 -user               : specify user (for use with -ssh; must have registered a public key)
 -strictHostKey      : request strict host key checking (for use with -ssh)
 -logger FINE        : enable detailed logging from the client
 -auth [ USER:SECRET | @FILE ] : specify username and either password or API token (or load from them both from a file);
                                 for use with -http.
                                 Passing credentials by file is recommended.
                                 See https://www.jenkins.io/redirect/cli-http-connection-mode for more info and options.
 -bearer [ TOKEN | @FILE ]     : specify authentication using a bearer token (or load the token from file);
                                 for use with -http. Mutually exclusive with -auth.
                                 Passing credentials by file is recommended.

The available commands depend on the server. Run the 'help' command to see the list.
```

jenkins@default-8v9pn:~/agent$ java -jar jenkins-cli.jar -s http://jenkins:8080/ list-jobs
test
jenkins@default-8v9pn:~/agent$ java -jar jenkins-cli.jar -s http://jenkins:8080/ get-job test
