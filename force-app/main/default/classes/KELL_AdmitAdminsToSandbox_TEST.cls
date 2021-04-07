//HEADER
//HEADER
//HEADER
//HEADER
//HEADER

@isTest
class KELL_AdmitAdminsToSandbox_TEST {
 
    @isTest
    static void testMySandboxPrep() {
     
        // Query profile IDs needed for test users, ordered by name to return Standard User first, then System Administrator second.
        // Perform an assertion to verify list size
        List<Profile> relevantProfiles = [SELECT Id, Name FROM Profile WHERE Name IN('Standard User','System Administrator') ORDER BY Name ASC];
        system.assertEquals(relevantProfiles.size(),2);
        
        //create test users, referencing profile Ids captured above
        List<User> testUsers = new List<User>{
                                new User(FirstName='Test1F',LastName='Test1L',Username='test_record1@gmail.com',Email='test_record1@gmail.com',ProfileId=relevantProfiles[0].Id,
                                            Alias='tUse1',CommunityNickname='tuse1',LocaleSidKey='en_US',TimeZoneSidKey='GMT',LanguageLocaleKey='en_US',EmailEncodingKey='UTF-8'),
                                new User(FirstName='Test2F',LastName='Test2L',Username='test_record2@gmail.com',Email='test_record2@gmail.com',ProfileId=relevantProfiles[1].Id,
                                            Alias='tUse2',CommunityNickname='tuse2',LocaleSidKey='en_US',TimeZoneSidKey='GMT',LanguageLocaleKey='en_US',EmailEncodingKey='UTF-8')
                                };
        insert testUsers;

        Test.startTest();
 
        Test.testSandboxPostCopyScript(
            new KELL_AdmitAdminsToSandbox(), UserInfo.getOrganizationId(),
                UserInfo.getOrganizationId(), 'test_sbx');
 
        Test.stopTest();

    }
}