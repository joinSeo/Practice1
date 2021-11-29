@isTest
private class TestRestrictContactByName {
    @isTest static void createBadContact() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        Contact cont = new Contact(FirstName='Seo', LastName= 'INVALIDNAME');
               
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(cont, false);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
    }
    
}