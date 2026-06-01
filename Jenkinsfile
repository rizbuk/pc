pipeline {

    agent any

 

    stages {

        stage('git clone') {

            steps {

                cleanWs()

                git branch: 'main', url: 'https://github.com/rizbuk/pc.git'

                sh "ls -la"

            }

        }

        stage('docker build') {

            steps {

                sh "docker build -t maks83/petklinikkkkkk:v8 -t petclinic:latest ."

            }

         }
        stage('docker_push') {

            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_pass', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
    // some block

                    sh "docker login -u $USER -p $PASS"
                    sh "docker push  maks83/petklinikkkkkk:v8"
                }
            }

        }
    }
}
