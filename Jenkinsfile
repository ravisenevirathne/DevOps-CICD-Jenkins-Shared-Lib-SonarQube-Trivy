@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'java-springboot-demo')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'ravisenevirathne')
    }

    stages{

        stage('Git Checkout'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    gitCheckout(
                        branch: "master",
                        url: "https://github.com/ravisenevirathne/DevOps-CICD-Jenkins-Shared-Lib-SonarQube-Trivy.git"
                    )
                    // git 'https://github.com/ravisenevirathne/DevOps-CICD-Jenkins-Shared-Lib-SonarQube-Trivy.git'
                }
            }
        }

        stage('Unit Test maven'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    mvnTest()
                }
            }      
        }

        stage('Integration Test maven'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    mvnIntegrationTest()
                }
            }      
        }

        stage('Static Code Analysis: Sonarqube'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    def SonarQubecredentialsId= 'sonar-api'
                    staticCodeAnalysis(SonarQubecredentialsId)
                }
            }      
        }

        stage('Quality Gate Status: Sonarqube'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    def SonarQubecredentialsId= 'sonar-api'
                    qualityGateStatus(SonarQubecredentialsId)
                }
            }      
        }

        stage('Maven Build'){
        when { expression { params.action == 'create'}}
            steps{
                script{

                    mvnBuild()
                }
            }      
        }

        stage('Docker Build'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    
                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                }
            }      
        }

        stage('Docker Image Scan: trivy '){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }

    }

}

