# Jenkins CLI
---

## help
---
```shell
vagrant@vagrant:~$ kubectl exec -it jenkins-cli -- jenkins-cli
  add-job-to-view
    Adds jobs to view.
  apply-configuration
    Apply YAML configuration to instance
  build
    Builds a job, and optionally waits until its completion.
  cancel-quiet-down
    Cancel the effect of the "quiet-down" command.
  check-configuration
    Check YAML configuration to instance
  clear-queue
    Clears the build queue.
  connect-node
    Reconnect to a node(s)
  console
    Retrieves console output of a build.
  copy-job
    Copies a job.
  create-credentials-by-xml
    Create Credential by XML
  create-credentials-domain-by-xml
    Create Credentials Domain by XML
  create-job
    Creates a new job by reading stdin as a configuration XML file.
  create-node
    Creates a new node by reading stdin as a XML configuration.
  create-view
    Creates a new view by reading stdin as a XML configuration.
  declarative-linter
    Validate a Jenkinsfile containing a Declarative Pipeline
  delete-builds
    Deletes build record(s).
  delete-credentials
    Delete a Credential
  delete-credentials-domain
    Delete a Credentials Domain
  delete-job
    Deletes job(s).
  delete-node
    Deletes node(s)
  delete-view
    Deletes view(s).
  disable-job
    Disables a job.
  disable-plugin
    Disable one or more installed plugins.
  disconnect-node
    Disconnects from a node.
  enable-job
    Enables a job.
  enable-plugin
    Enables one or more installed plugins transitively.
  export-configuration
    Export jenkins configuration as YAML
  get-credentials-as-xml
    Get a Credentials as XML (secrets redacted)
  get-credentials-domain-as-xml
    Get a Credentials Domain as XML
  get-job
    Dumps the job definition XML to stdout.
  get-node
    Dumps the node definition XML to stdout.
  get-view
    Dumps the view definition XML to stdout.
  groovy
    Executes the specified Groovy script. 
  groovysh
    Runs an interactive groovy shell.
  help
    Lists all the available commands or a detailed description of single command.
  import-credentials-as-xml
    Import credentials as XML. The output of "list-credentials-as-xml" can be used as input here as is, the only needed change is to set the actual Secrets which are redacted in the output.
  install-plugin
    Installs a plugin either from a file, an URL, or from update center. 
  keep-build
    Mark the build to keep the build forever.
  list-changes
    Dumps the changelog for the specified build(s).
  list-credentials
    Lists the Credentials in a specific Store
  list-credentials-as-xml
    Export credentials as XML. The output of this command can be used as input for "import-credentials-as-xml" as is, the only needed change is to set the actual Secrets which are redacted in the output.
  list-credentials-context-resolvers
    List Credentials Context Resolvers
  list-credentials-providers
    List Credentials Providers
  list-jobs
    Lists all jobs in a specific view or item group.
  list-plugins
    Outputs a list of installed plugins.
  mail
    Reads stdin and sends that out as an e-mail.
  offline-node
    Stop using a node for performing builds temporarily, until the next "online-node" command.
  online-node
    Resume using a node for performing builds, to cancel out the earlier "offline-node" command.
  quiet-down
    Quiet down Jenkins, in preparation for a restart. Don’t start any builds.
  reload-configuration
    Discard all the loaded data in memory and reload everything from file system. Useful when you modified config files directly on disk.
  reload-jcasc-configuration
    Reload JCasC YAML configuration
  reload-job
    Reload job(s)
  remove-job-from-view
    Removes jobs from view.
  replay-pipeline
    Replay a Pipeline build with edited script taken from standard input
  restart
    Restart Jenkins.
  restart-from-stage
    Restart a completed Declarative Pipeline build from a given stage.
  safe-restart
    Safe Restart Jenkins. Don’t start any builds.
  safe-shutdown
    Puts Jenkins into the quiet mode, wait for existing builds to be completed, and then shut down Jenkins.
  session-id
    Outputs the session ID, which changes every time Jenkins restarts.
  set-build-description
    Sets the description of a build.
  set-build-display-name
    Sets the displayName of a build.
  shutdown
    Immediately shuts down Jenkins server.
  stop-builds
    Stop all running builds for job(s)
  update-credentials-by-xml
    Update Credentials by XML
  update-credentials-domain-by-xml
    Update Credentials Domain by XML
  update-job
    Updates the job definition XML from stdin. The opposite of the get-job command.
  update-node
    Updates the node definition XML from stdin. The opposite of the get-node command.
  update-view
    Updates the view definition XML from stdin. The opposite of the get-view command.
  version
    Outputs the current version.
  wait-node-offline
    Wait for a node to become offline.
  wait-node-online
    Wait for a node to become online.
  who-am-i
    Reports your credential and permissions.
vagrant@vagrant:~$ 
```

## plugin
---
```shell
  disable-plugin
    Disable one or more installed plugins.
  enable-plugin
    Enables one or more installed plugins transitively.
  install-plugin
    Installs a plugin either from a file, an URL, or from update center. 
  list-plugins
    Outputs a list of installed plugins.
```

## node
---
```shell
  connect-node
    Reconnect to a node(s)
  create-node
    Creates a new node by reading stdin as a XML configuration.
  delete-node
    Deletes node(s)
  disconnect-node
    Disconnects from a node.
  get-node
    Dumps the node definition XML to stdout.
  offline-node
    Stop using a node for performing builds temporarily, until the next "online-node" command.
  online-node
    Resume using a node for performing builds, to cancel out the earlier "offline-node" command.
  update-node
    Updates the node definition XML from stdin. The opposite of the get-node command.
  wait-node-offline
    Wait for a node to become offline.
  wait-node-online
    Wait for a node to become online.
```

## view
---
```shell
  add-job-to-view
    Adds jobs to view.
  create-view
    Creates a new view by reading stdin as a XML configuration.
  delete-view
    Deletes view(s).
  get-view
    Dumps the view definition XML to stdout.
  list-jobs
    Lists all jobs in a specific view or item group.
  remove-job-from-view
    Removes jobs from view.
  update-view
    Updates the view definition XML from stdin. The opposite of the get-view command.
```

## job
---
```shell
  add-job-to-view
    Adds jobs to view.
  build
    Builds a job, and optionally waits until its completion.
  copy-job
    Copies a job.
  create-job
    Creates a new job by reading stdin as a configuration XML file.
  delete-job
    Deletes job(s).
  disable-job
    Disables a job.
  enable-job
    Enables a job.
  get-job
    Dumps the job definition XML to stdout.
  list-jobs
    Lists all jobs in a specific view or item group.
  reload-job
    Reload job(s)
  remove-job-from-view
    Removes jobs from view.
  replay-pipeline
    Replay a Pipeline build with edited script taken from standard input
  stop-builds
    Stop all running builds for job(s)
  update-job
    Updates the job definition XML from stdin. The opposite of the get-job command.
```

## credentials
---
```shell
  create-credentials-by-xml
    Create Credential by XML
  create-credentials-domain-by-xml
    Create Credentials Domain by XML
  delete-credentials
    Delete a Credential
  delete-credentials-domain
    Delete a Credentials Domain
  get-credentials-as-xml
    Get a Credentials as XML (secrets redacted)
  get-credentials-domain-as-xml
    Get a Credentials Domain as XML
  import-credentials-as-xml
    Import credentials as XML. The output of "list-credentials-as-xml" can be used as input here as is, the only needed change is to set the actual Secrets which are redacted in the output.
  list-credentials
    Lists the Credentials in a specific Store
  list-credentials-as-xml
    Export credentials as XML. The output of this command can be used as input for "import-credentials-as-xml" as is, the only needed change is to set the actual Secrets which are redacted in the output.
  list-credentials-context-resolvers
    List Credentials Context Resolvers
  list-credentials-providers
    List Credentials Providers
  update-credentials-by-xml
    Update Credentials by XML
  update-credentials-domain-by-xml
    Update Credentials Domain by XML
```

## rest
---
```shell
  apply-configuration
    Apply YAML configuration to instance
  cancel-quiet-down
    Cancel the effect of the "quiet-down" command.
  check-configuration
    Check YAML configuration to instance
  clear-queue
    Clears the build queue.
  console
    Retrieves console output of a build.
  declarative-linter
    Validate a Jenkinsfile containing a Declarative Pipeline
  delete-builds
    Deletes build record(s).
  export-configuration
    Export jenkins configuration as YAML
  groovy
    Executes the specified Groovy script. 
  groovysh
    Runs an interactive groovy shell.
  help
    Lists all the available commands or a detailed description of single command.
  keep-build
    Mark the build to keep the build forever.
  list-changes
    Dumps the changelog for the specified build(s).
  mail
    Reads stdin and sends that out as an e-mail.
  quiet-down
    Quiet down Jenkins, in preparation for a restart. Don’t start any builds.
  reload-configuration
    Discard all the loaded data in memory and reload everything from file system. Useful when you modified config files directly on disk.
  reload-jcasc-configuration
    Reload JCasC YAML configuration
  restart
    Restart Jenkins.
  restart-from-stage
    Restart a completed Declarative Pipeline build from a given stage.
  safe-restart
    Safe Restart Jenkins. Don’t start any builds.
  safe-shutdown
    Puts Jenkins into the quiet mode, wait for existing builds to be completed, and then shut down Jenkins.
  session-id
    Outputs the session ID, which changes every time Jenkins restarts.
  set-build-description
    Sets the description of a build.
  set-build-display-name
    Sets the displayName of a build.
  shutdown
    Immediately shuts down Jenkins server.
  version
    Outputs the current version.
  who-am-i
    Reports your credential and permissions.
```
