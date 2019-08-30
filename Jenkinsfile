pipeline{
    agent any
    tools {
        maven 'maven'
    }
    environment {
        //gitURL = "https://github.com/jglick/simple-maven-project-with-tests.git"
        gitURL = "https://github.com/Nagaraj4775/Jenkins-Example.git"
    }
    stages{
        stage('git clone'){
            steps{
                script{
                    cleanWs()
                    git credentialsId: 'git_creds', poll: false, url: "${gitURL}", branch: 'master'
                    echo "${env.BRANCH_NAME}"
                    echo "$env.BRANCH_NAME"
                }
            }
        }
        stage('Jenkins Build'){
            steps{
                script{
                    echo "We are in Jenkins build stage"
                    sh "mvn clean package -Dmaven.test.failure.ignore=true"
                }
            }
            post{
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
		            archive 'target/*.jar'    
                }
            }
        }
        stage('Upload Artifacts') {
	      steps{
	        	script {
		        	sh "echo 'uploading Artifacts'"
		        }
	        }
        }
        stage('Development') {
	      steps{
	        	script {
		        	sh "echo 'Successfully deployed into Development environment'"
		        }
	        }
        }
        
        stage('Production') {
        when { branch 'master' }
         input {
                  message 'Do you want to approve'
                  submitter 'nagaraj'
                }
                options {
                  timeout(time: 1, unit: 'HOURS' )
            }

	      steps{
	        	script {
		        	sh "echo 'Successfully deployed into Production environment'"
		        }
	        }
        }
    }
}
