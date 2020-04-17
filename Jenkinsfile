node {
  def app
  stage('Clone repository') {
    checkout scm
  }
  stage('Build image') {
    app = docker.build("${env.JOB_NAME}:${env.BUILD_ID}")
  }
  stage('Test image') {
    app.inside {
      python3 manage.py test
    }
  }
}
