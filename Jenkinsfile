pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = '5ece2bec-1ffe-44bc-a9f5-c8a751dd64fd' // Update with your actual credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Use the 'git' step to checkout the repository
                script {
                    git branch: 'master', credentialsId: env.GIT_CREDENTIALS_ID, url: 'https://github.com/Drashti1603/Scripts-eg-.git'
                }
            }
        }

        stage('Execute Python Script') {
            steps {
                // Execute the Python script
                sh count.sh // Assuming 'python' command is available in the environment
            }
        }
    }
}