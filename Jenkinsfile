pipeline {
    agent any
    stages {
        stage('Build_1') {
            steps {
                sh 'echo "Hello World"'
                }
            }
        stage('Lint .py') {
            steps {
                sh 'pylint ./notebooks/tmp/converted-notebooks/rain_in_spain.py --disable=C,E0602,W0301,W0621 --exit-zero'
            }
        }
    }
}
