node {
    stage('Clone') { // for display purposes
        // Clone the configurations repository
        cleanWs()
        git 'https://github.com/SallyNader/terraform.git'   
    }
    stage('Download') {
        // Download Terraform
        sh label: '', script: 'curl https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip \
            --output terraform_0.12.29_darwin_amd64.zip \
             && unzip terraform_0.12.29_darwin_amd64.zip'
    }
    stage('Backend-Init') {
        // Initialize the Terraform configuration
       
            sh script: 'terraform init -input=false'
        
    }
    stage('Backend-Plan') {
        // Create Terraform plan for backend resources
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                sh script: 'terraform plan \
                        -var="aws_access_key=$aws_access_key" \
                        -var="aws_secret_key=$aws_secret_key"'
            
        }
    }
    stage('Backend-Apply') {
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                            
                                sh script: 'terraform apply \
                        -var="aws_access_key=$aws_access_key" \
                        -var="aws_secret_key=$aws_secret_key"'
                           
        }
    }

 
}