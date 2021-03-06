def image

pipeline {
    agent any
    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    sh 'docker run --rm -i hadolint/hadolint < ./notebooks/Dockerfile | tee -a hadolint.txt'
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
                    image = docker.build("alisondavey/rain_in_spain", "-f ./notebooks/Dockerfile notebooks")
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
        stage('Apply deployment') {
            steps {
                sh 'echo "Post-project, cluster killed. See stage text in kubernetes directory"'
                }
            }
        stage('Tidy up Docker') {
            steps {
                script {
                    sh 'docker system prune -f'
                }
            }
        }
    }
}
