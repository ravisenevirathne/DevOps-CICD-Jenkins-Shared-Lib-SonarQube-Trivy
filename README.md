# DevOps CICD Jenkins Pipeline using Jenkins-Shared-Lib with SonarQube and Trivy scanning
![Alt text](images/image-jobs.png)

![Alt text](images/image.png)

![Alt text](images/image-cd.png)

### Steps

Create t3.large (2vCPU, 8GB Ram, 30GB HDD) ubuntu vm and install below packages

Jenkins
```
#!/bin/bash
sudo apt update -y
sudo apt upgrade -y 
sudo apt install openjdk-17-jre -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y 
sudo apt-get install jenkins -y 
```

Docker 
```
#!/bin/bash
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
sudo apt update -y
apt-cache policy docker-ce -y
sudo apt install docker-ce -y
#sudo systemctl status docker
sudo chmod 777 /var/run/docker.sock
```

Maven
```
sudo apt update -y
sudo apt install maven -y
mvn -version
```

SonarQube
```
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
```

Trivy
```sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy
```

Terraform Install
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
```

AWS CLI Install
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

Kubectl Install
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

```

Install these Jenkins Plugins
![Alt text](images/image-2.png)

Set Sonar and DockerHub Credentials
![Alt text](images/image-1.png)

Add SonarQube Server to Jenkins
![Alt text](images/image-3.png)

Setup the Shared Library Repository
![Alt text](images/image-4.png)

On SonarQube (IP:9000) create the token for Jenkins
![Alt text](images/image-5.png)

On SonarQube (IP:9000) create the webhook for Jenkins
![Alt text](images/image-6.png)
