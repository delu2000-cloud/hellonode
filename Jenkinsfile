node {
    def app
    stage('Clone repository') {

        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    
    
    stage('Create Docker Image') {
        docker.build("image-${env.JOB_NAME}:${env.BUILD_ID}")
    }


    stage ('Run Application') {
        try {
          // Start database container here
          // sh 'docker run -d --name db -p 8091-8093:8091-8093 -p 11210:11210 arungupta/oreilly-couchbase:latest'

          // Run application using Docker image
          sh "docker run -d --name image${env.BUILD_ID}  -p 8000:8000 "image-${env.JOB_NAME}:${env.BUILD_ID}"

        } catch (error) {
        } finally {
          // Stop and remove database container here
          sh 'docker stop image${env.BUILD_ID}'
          sh 'docker rm image${env.BUILD_ID}'
        }
    }
}
