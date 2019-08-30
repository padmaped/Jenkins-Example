pipeline{
    agent any
    tools {
        maven 'maven'
    }
    environment {
        gitURL = "https://github.com/jglick/simple-maven-project-with-tests.git"
	 branch = "Dev-1"
    }
    stages{
        stage('git clone'){
            steps{
                script{
                    cleanWs()
                    git "${gitURL}"
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
        }
       stage('Generating Results') {
	      steps{
	        	script {
		        	junit '**/target/surefire-reports/TEST-*.xml'
		        	archive 'target/*.jar'
				echo "You are in ${branch}"
		        }
	        }
        }
        
    }
}
