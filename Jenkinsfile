node {
    def app
    stage('Clone repository') {

        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {

        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("image-${env.JOB_NAME}:${env.BUILD_ID}")
        app = docker.image("image-${env.JOB_NAME}:${env.BUILD_ID}").withRun('-p 8000:8000')
    }

    stage('Test image') {

        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    
    stage('Stop Docker Containers') {
      sh 'docker stop $(docker ps -a -q)'
    }
    
    stage('Stop Docker Containers') {
      sh 'docker rm $(docker ps -a -q)'
    }
    
    stage('Remove Docker Images') {
      sh 'docker rmi "image-${env.JOB_NAME}:${env.BUILD_ID}"'
    }
}
