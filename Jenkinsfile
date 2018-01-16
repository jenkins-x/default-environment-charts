pipeline {
  agent {
    label "jenkins-maven"
  }

  
  stages {
    stage('Validate Environment') {
      steps {
        container('maven') {
          sh 'make build'
        }
      }
    }
    stage('Update Environment') {
      when {
        branch 'master'
      }
      steps {
        container('maven') {
          sh 'make install'
        }
      }
    }
  }
}
