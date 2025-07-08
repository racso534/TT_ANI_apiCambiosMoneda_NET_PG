pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'apicambiosmonedatt'
        CONTAINER_NAME = 'dockerapicambiosmonedatt'
        APP_PORT = '5235'
        HOST_PORT = '7080'
        DOCKER_NETWORK = 'dockermonedas_red'
    }

    stages {
        stage('Ejecutar pruebas unitarias') {
            steps {
                script {
                    bat "dotnet test apiCambiosMoneda.Test\\apiCambiosMoneda.Test.csproj --configuration Release"
                }
            }
        }
        stage('Construir imagen docker') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Limpiar contenedor existente') {
            steps { 
                script {               
                    catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {					
                        bat "docker container rm -f ${CONTAINER_NAME} || exit 0"
                    }
                }
            }
        }
        stage('Ejecutar Contenedor') {
            steps{				
                bat "docker run --network ${DOCKER_NETWORK} --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -d ${DOCKER_IMAGE}"				
            }
        }	
    }
}