pipeline {
    agent any

    environment {
        ARTIFACT_NAME = "meteorite-scripts.zip"
    }

    stages {
        stage('Verifying Scripts do Exist') {
            steps {
                echo 'Checking for script files...'
                sh 'ls task1_massive_meteorite.sh task2_meteorites_prague.sh'
            }
        }

        stage('Run Scripts') {
            steps {
                echo 'Running task1 script...'
                sh 'bash task1_massive_meteorite.sh'

                echo 'Running task2 script...'
                sh 'bash task2_meteorites_prague.sh'
            }
        }

        stage('zipping Scripts') {
            steps {
                echo "Zipping scripts into ${env.ARTIFACT_NAME}"
                sh 'zip -r $ARTIFACT_NAME task1_massive_meteorite.sh task2_meteorites_prague.sh'
            }
        }

        stage('Faking Deployment') {
            steps {
                echo 'Faking deployment...'
                sh 'mkdir -p /tmp/meteorite-app && cp $ARTIFACT_NAME /tmp/meteorite-app/'
                echo "Deployment complete. Artifact copied to /tmp/meteorite-app/"
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
