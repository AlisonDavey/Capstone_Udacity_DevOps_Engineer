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
                pylint ./notebooks/tmp/converted-notebooks/*.py
            }
        }
    }
}
