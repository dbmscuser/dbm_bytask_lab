def call(String javaCmd, String projectName, String envName, String taskName, String server, String authType, String useSSL, String dbmCredentials){
  helpMsgbox("BUilding Package")
  withCredentials([usernamePassword(credentialsId: dbmCredentials, usernameVariable: 'username', passwordVariable: 'token')]){
    bat "${javaCmd} -Build -ProjectName ${projectName}  -EnvName ${envName} -VersionType Tasks -AdditionalInformation ${taskName} -CreatePackage True  -PackageName ${taskName} -CreateDowngradeScripts True  -Server ${server} -AuthType ${authType} " + ' -UserName %username% -Password %token%'
  }
}