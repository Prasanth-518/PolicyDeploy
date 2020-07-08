def secrets=[[
            path:'credentials/artifactory',
            secretValues:[[envVar:'username',vaultKey:'usr'],[envVar:'pswd',vaultKey:'pswd']]
            ]]
def config=[vaultCredentialId: 'articreds']
pipeline{
    agent any
    stages{
        stage('clean'){
            steps{
                powershell(script:"Remove-Item *.zip") 
                powershell(script:"C:/Policies ; remove-item *.rb")
            }
        }
        stage('lint'){
            steps{
                powershell(script:"cookstyle -a")
            }
        }
        stage('deploy'){
            steps{
                powershell(script: "Compress-Archive Policies/*.rb ApachePolicy-7.20.${BUILD_NUMBER}.zip")
                withVault([configuration: config,vaultSecrets: secrets]){
                    powershell(script:"jfrog rt c rt-server-1 --url=http://192.168.33.20:8082/artifactory --user=${username} --password=${pswd}")
                    powershell(script:"jfrog rt u *.zip Policies")
                }
            }
        }
    }
}