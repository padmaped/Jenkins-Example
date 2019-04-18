pipeline {
    agent any
    stages{
        stage('Build'){
            steps{
              git 'https://github.com/Nagaraj4775/Jenkins-Example.git'
          }
        }
        stage('upload'){
            steps{
              script{
                  s3Upload consoleLogLevel: 'INFO', dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'nagaraj-devops/uploaded', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-southeast-1', showDirectlyInBrowser: false, sourceFile: 'output.csv', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3-Role', userMetadata: []
              }
          }
        }
      }
    }
