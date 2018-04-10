#!/usr/bin/env bash
set -xe
oc delete project cicd-demo
oc delete project testing
oc delete project production
