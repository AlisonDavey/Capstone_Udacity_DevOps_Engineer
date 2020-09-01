def image

pipeline {
    agent any
    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint ./application/Dockerfile | tee -a hadolint.txt'
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
        stage('Build_1') {
            steps {
                sh 'echo "Hello World"'
                }
            }
        stage('Lint .py') {
            steps {
                sh 'pylint ./notebooks/tmp/converted-notebooks/rain_in_spain.py --disable=all'
            }
        }
    }
}
