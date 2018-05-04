#!/usr/bin/env bash
set -xe
oc new-project cicd-demo
oc new-app jenkins-persistent
oc new-project testing
oc new-project production
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n testing
oc policy add-role-to-user edit system:serviceaccount:cicd-demo:jenkins -n production
oc create -f pipelines/development-pipeline.yaml -n cicd-demo

