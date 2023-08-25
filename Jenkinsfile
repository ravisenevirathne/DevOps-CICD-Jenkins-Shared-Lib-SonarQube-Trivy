@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/destroy')
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

        stage('Maven Build:  maven'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    mvnBuild()
                }
            }      
        }

    }

}
