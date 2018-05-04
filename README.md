Example pipeline + code for Jenkins in OpenShift
================================================

WARNING:  
If deployment or build fails, first pull the image:
`oc import-image httpd --all -n openshift`

``` bash
oc new-project cicd-demo
oc new-app jenkins-persistent
oc new-project testing
oc new-project production
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n testing
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n production
oc create pipelines/development-pipeline.yaml -n cicd-demo
```
