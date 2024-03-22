node {
    def dockerImageTag = "springboot-deploy${env.BUILD_NUMBER}"
    try{
    //notifyBuild('STARTED')
        stage('Clone Repo') {
            checkout scm
            echo "Cloning branch: ${env.BRANCH_NAME}"
        }
        stage('Build docker') {
            echo "Docker Image Tag Name: ${dockerImageTag}"
            bat "dir"
            // bat "mvn clean package -DskipTests"
            // dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
        }
        stage('Deploy docker') {
            echo "Docker Image Tag Name: ${dockerImageTag}"
            
            // Detener y eliminar el contenedor existente (si existe)
            bat 'docker stop springboot-deploy >NUL 2>&1 || exit /B 0'
            bat 'docker rm springboot-deploy >NUL 2>&1 || exit /B 0'
            
            // Ejecutar un nuevo contenedor
            bat "docker run --name springboot-deploy -d -p8083:8083 springboot-deploy:${env.BUILD_NUMBER}"
        }
        stage('Integration test'){
            bat "mvn clean test"
        }
        stage('Report'){
            allure includeProperties: false, jdk: '', reportBuildPolicy: 'ALWAYS', results: [[path: 'target/allure-results']]
        }
    }catch(e){
//      currentBuild.result = "FAILED"
        throw e
    }finally{
//      notifyBuild(currentBuild.result)
    }
}