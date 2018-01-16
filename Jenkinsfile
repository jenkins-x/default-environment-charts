pipeline {
  agent {
    label "jenkins-maven"
  }

  stages {
    stage('Update Environment') {
      steps {
        container('maven') {
          sh 'make install'
        }
      }
    }
  }
}
