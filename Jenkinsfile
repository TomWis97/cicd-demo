        node('maven') {
        stage 'build'
        openshiftBuild(buildConfig: 'httpd-example', showBuildLogs: 'true', namespace: 'development')
        stage 'deploy'
        openshiftDeploy(deploymentConfig: 'httpd-example', namespace: 'development')
        }
