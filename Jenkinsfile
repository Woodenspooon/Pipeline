pipeline {
    agent any  // Use any available Jenkins agent (node)

    triggers {
        githubPush()  // Automatically trigger on GitHub push (requires webhook)
    }

    environment {
        DEPLOY_SCRIPT = './deploy.sh'
        TEST_SCRIPT = './run-tests.sh'
    }

    stages {

        stage('Clone Repository') {
            steps {
                echo '📥 Cloning repository...'
                git 'https://github.com/Woodenspoon/Pipeline.git'
            }
        }

        stage('Run Tests') {
            when {
                expression { fileExists(env.TEST_SCRIPT) }
            }
            steps {
                echo '🧪 Running test script...'
                sh "${env.TEST_SCRIPT}"
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Deploying application...'
                sh "${env.DEPLOY_SCRIPT}"
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment completed successfully.'
        }
        failure {
            echo '❌ Build or deployment failed.'
        }
    }
}
