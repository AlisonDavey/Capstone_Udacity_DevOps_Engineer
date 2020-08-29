pipeline {
    agent any
    stages {
        stage('Build_1') {
            steps {
                sh 'echo "Hello World"'
                }
            }
        stage('Build_2') {
            steps {
                sh '''
                    echo "Multiline shell steps work too"
                    ls -lah
                '''
            }
        }
    }
}
