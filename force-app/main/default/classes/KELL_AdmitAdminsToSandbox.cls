//HEADER
//HEADER
//HEADER
//HEADER
//HEADER

global class KELL_AdmitAdminsToSandbox implements SandboxPostCopy {
    global void runApexClass(SandboxContext context) {
        System.debug('Org ID: ' + context.organizationId());
        System.debug('Sandbox ID: ' + context.sandboxId());
        System.debug('Sandbox Name: ' + context.sandboxName());
 
       List<User> systemAdmins = [SELECT Id, FirstName, LastName, Username, Email FROM User WHERE Profile.Name='System Administrator'];
       
       //in the loop below, we'll we'll remove 8 characters (the length of string '.invalid') from the end
       //of each system admin user's email address (thereby removing that substring).
       for(User cUser : systemAdmins){
           cUser.Email = cUser.Email.left(cUser.Email.length()-8);
       }
       
       update systemAdmins;
    }
}