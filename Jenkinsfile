def image

pipeline {
    agent any
    stages {
        stage('Hello World') {
            steps {
                sh 'echo "Hello World"'
                }
            }
        stage('Lint notebooks .py') {
            steps {
                sh 'pylint ./notebooks/tmp/converted-notebooks/rain_in_spain.py --disable=all'
            }
        }
        stage('Lint Dockerfile') {
            steps {
                script {
                    sh 'sudo docker run --rm -i hadolint/hadolint < Dockerfile | tee -a hadolint.txt'
                    sh '''
                        lintErrors=$(stat --printf="%s"  hadolint.txt)
                        if [ "$lintErrors" -gt "0" ]; then
                            echo "Errors linting Dockerfile"
                            cat hadolint.txt
                            exit 1
                        else
                                echo "Done linting Dockerfile"
                            fi
                        '''
                    }
                }
            }
        stage('Build docker') {
            steps {
                script {
                    image = docker.build("alisondavey/rain_in_spain", "-f Dockerfile ./notebooks")
                }
            }
        }
        stage('Push docker') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        image.push("${env.BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }        
    }
}
