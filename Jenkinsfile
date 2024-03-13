pipeline {
    agent any

    stages {
        stage('Git clone') {
            steps {
                
                git branch: 'yasser' ,
                url: 'https://github.com/hedi3/devops.git'
                
            }
        }
         stage('build JAR') {
            steps {
              sh "mvn clean package -DskipTests=true"
				archive 'target/*.jar'
                
            }
         }
        stage('SonarQube test') {
			steps {
				sh "mvn clean install"
				sh "mvn sonar:sonar \
                                    -Dsonar.projectKey=sonar-ci \
                                     -Dsonar.host.url=http://20.124.89.136:9000 \
                                        -Dsonar.login=41a37e34139f2686f63f5a35c818e84d4e661b9b"

			}
			
		}
	/*
        stage('Nexus') {
			steps {				
				sh'mvn clean deploy -Dmaven.test.skip=true -Dresume=false'
			        }
	                } */
	    
       stage('docker build and push') {
            steps {
                sh'''
                
                docker build -t events:1.0.0 .
                docker login -u "yasser22" -p "123456789" docker.io
			  
        			
	 			docker tag events:1.0.0 yasser22/yasserrepo:newversion
         		docker push yasser22/yasserrepo:newversion
            '''
	    }
          }
                stage('Docker compose') {
       steps {
         parallel(
           "Docker compose": {
               sh 'docker-compose up '
           },
           "Delete running containers": {
		       sh 'sleep 7m '
               sh 'docker rm -f spring mysql '
           }
         )
       }
     }
           
         
    }
}
