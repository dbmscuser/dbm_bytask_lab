@Library('dbmaestro-library') _

/**********   LOCAL VARIABLES BEGIN   **********/
def varsPath = "jenkins-pipelines/vars.groovy"
def dbmJenkinsNode = "master"
/**********    LOCAL VARIABLES END    **********/

try{
  stage("Init"){
    node (dbmJenkinsNode) {
      checkout scm
      echo "NODE_NAME = ${env.NODE_NAME}"
      //rootDir = pwd()
      myvars = load varsPath
      //if ticket number comes from a Jenkins parameter9
      if(env.TICKET){
        issueKey = env.TICKET
        feedbackToJira = false
      }
      //if ticket number comes from Jira
      else{
        issueKey = env.JIRA_ISSUE_KEY
        feedbackToJira = true
      }
      packageFolder = issueKey
    }
  }

  stage("Packaging") {
    node (dbmJenkinsNode) {
      cleanWs()
      helpMsgbox("Build Package")
      dbmBuild(myvars.javaCmd, myvars.projectName, env.TICKET, myvars.server, myvars.authType, myvars.useSSL, myvars.dbmCredentials)
    }
  }  
  stage("Build") {
    node (dbmJenkinsNode) {
      echo "Building the project..."
      // Add your build steps here
    }
  }

  //DRY RUN ENV (PRECHECK)
  stage("DryRun"){
    node (dbmJenkinsNode) {
      dbmPreCheck(myvars.javaCmd, myvars.projectName, packageFolder, myvars.server, myvars.authType, myvars.useSSL, myvars.dbmCredentials)
    }
  }

  if(feedbackToJira){
    stage("Update Jira Issue"){
        withEnv(["JIRA_SITE=${myvars.jiraSite}"]) {
          def comment = [ body: "${BUILD_URL}console" ]
          /*  jiraIssueAddLabel(issueKey, myvars.precheckOkLabel)*/
        }
    }
  }
}

catch(e){
  if(feedbackToJira){
    withEnv(["JIRA_SITE=${myvars.jiraSite}"]) {
      def comment = [ body: "${BUILD_URL}console" ]
       /* jiraIssueAddLabel(issueKey, myvars.precheckErrorLabel)*/
    }
  }
  throw e
}

finally{
  if(feedbackToJira){
    withEnv(["JIRA_SITE=${myvars.jiraSite}"]) {
        def comment = [ body: "${BUILD_URL}console" ]
        jiraIssueAddComment(issueKey, comment)
    }
  }
}
