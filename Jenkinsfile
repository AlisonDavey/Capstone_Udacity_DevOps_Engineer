def image

pipeline {
    agent any
    stages {
        stage('Hello World') {
            steps {
                sh 'echo "Hello World"'
                }
            }
        stage('Lint Dockerfile') {
            steps {
                script {
                    sudo docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint Dockerfile | tee -a hadolint.txt'
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
        }
        stage('Lint .py') {
            steps {
                sh 'pylint ./notebooks/tmp/converted-notebooks/rain_in_spain.py --disable=all'
            }
        }
    }
}
