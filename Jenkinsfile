properties([pipelineTriggers([githubPush()])])

pipeline {
    agent any
    environment {
	DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-l9xhub')
	DATE=`date +%s`
    }

    stages {
        stage('Build') {
            steps {
                git branch: 'main',
                    credentialsId: 'eb41fdb4-beeb-428a-9c0e-20b054fd2597',
                    url: 'git@github.com:skiyl9x/lemp_images.git'
                sh 'docker build -t l9xhub/mariadb:$DATE --target img1 .'
	 	sh 'docker build -t l9xhub/nginx:$DATE --target img2 .'
		sh 'docker build -t l9xhub/php-fpm:$DATE --target img3 .'

            }
        }
        stage('Login') {
            steps {
		sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
	stage('Push') {
	    steps {
		sh 'docker push l9xhub/mariadb:$DATE'
		sh 'docker push l9xhub/nginx:$DATE'
		sh 'docker push l9xhub/php-fpm:$DATE'

	    }	
	}
	post {
		always {
			sh 'docker logout'
			sh 'docker rmi l9xhub/mariadb:$DATE l9xhub/nginx:$DATE l9xhub/php-fpm:$DATE'
		}
    }
}
