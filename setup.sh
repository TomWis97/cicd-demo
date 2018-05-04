#!/usr/bin/env bash
set -xe
oc login -u system:admin
oc import-image httpd --all -n openshift
oc new-project cicd-demo
oc new-app jenkins-persistent
oc new-project testing
oc new-project production
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n testing
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n production
oc create -f pipelines/development-pipeline.yaml -n cicd-demo
oc policy add-role-to-user admin admin -n cicd-demo
oc policy add-role-to-user admin admin -n production 
oc policy add-role-to-user admin admin -n testing

