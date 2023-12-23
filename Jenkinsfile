pipeline {
  agent any

  stages {
    stage('Example') {
      steps {
        echo 'Hello World'
      }
    }
    stage("job2") {
      steps {
        echo "called job2"
      }
    }
    stage("call extent contracts") {
      steps {
        executeExtentContracts()
      }
    }
  }
}

def executeExtentContracts() {
  def response = httpRequest contentType: "APPLICATION_JSON", httpMode: "POST", url: "${env.BACKEND_URL}/api/batch/extend_contract"
  println("Status: "+response.status)
  println("Content: "+response.content)
}