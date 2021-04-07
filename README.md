# AdmitAdminsToSandbox
# Status: NOT READY FOR USE

Owner: Sean Conner

Adds post-sandbox-deploy class that automatically removes the ".invalid" string at the end of all System Administrators' email addresses.

## Features and Use

Single post-sandbox-deploy class (KELL_AdmitAdminsToSandbox) and test class (KELL_AdmitAdminsToSandbox_TEST) to automatically modify all SYSTEM ADMINISTRATOR profiles copied into a new sandbox to have the appropriate email address values. This feature is generally helpful only when clients frequently deploy new sandboxes or we at KELL will need to do so.

To use, siimply refer to the main class (KELL_AdmitAdminsToSandbox) when creating new sandboxes. 

## Deployment Steps

1. Use the installer <a href="https://githubsfdeploy.herokuapp.com?owner=KELLPartners&repo=AdmitAdminsToSandbox&ref=main">here</a> 
    1. Be sure to verify the Production or Sandbox location before proceeding
    2. Leave all other settings as-is
    3. Use the "Login" button to authorize access to the org and proceed, and complete the installation as you would expect
2. Refer to the class as noted in "Features and Use" when creating new sandboxes.

## Future Development Work

Tidy up copyright and description info, add documentation
