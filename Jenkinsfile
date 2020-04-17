node {
  def app
  stage('Clone repository') {
    checkout scm
  }
  stage('Build image') {
    app = docker.build("my-image:${env.BUILD_ID}")
  }
}
