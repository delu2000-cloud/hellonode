def app
node {
    stage('Clone repository') {
      checkout scm
    }
    stage('Build image') {
      def app = docker.build("my-image:${env.BUILD_ID}")
    }
  }
