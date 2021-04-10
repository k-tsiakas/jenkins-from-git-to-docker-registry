# Instructions

### 1. Init: Create user

### 2. Download Plugins
Download the suggested and
checkout the plugins below...

https://plugins.jenkins.io/ssh-steps/   
https://www.jenkins.io/blog/2019/02/06/ssh-steps-for-jenkins-pipeline/
https://www.jenkins.io/doc/pipeline/steps/ssh-steps/

Manage Jenkins -> Manage Plugins -> download

### 3. Create credentials
Manage Jenkins -> Manage credentials -> global, add credentials
- for a registry
- for a host
- for git

### 4. Create a pipeline
New Item->Pipeline.. Pipeline Script From SCM where

use the SimpleJenkinsFile context as your base, only need to modify credentials.

Note: take a look at New Item->Pipeline.. Pipeline Script From SCM,  where
you can add your git repository there instead of pipeline and use the JenkinsFile within the project you fetched from your repository. Also you can add triggers or a hook from your git repository(In this case you need to deploy your Jenkins under a public IP)
