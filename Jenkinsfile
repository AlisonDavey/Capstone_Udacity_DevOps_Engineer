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
                sh 'pylint ./notebooks/tmp/converted-notebooks/rain_in_spain.py --disable=all'
            }
        }
    }
}
