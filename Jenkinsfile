node{
     
    stage('Git Clone'){
        git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/KRISHN1952/poc.git',branch: 'master'
    }
    
    stage('Build Docker Image'){
      withCredentials([string(credentialsId: 'DOCKER_HUB_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
        sh 'docker login -u krishna1952 -p ${DOCKER_HUB_CREDENTIALS}'
      }
        sh "docker build -t cloudedge/poc-2 ."
    }
    
    stage('Push Docker Image'){
        sh "docker push cloudedge/poc-2"
    }   
    stage ('deploy to kubernetes'){
        kubernetesDeploy(
             kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
             configs: 'deployment.yml',
             enableConfigSubstitution: true,
            )
    }
} 
