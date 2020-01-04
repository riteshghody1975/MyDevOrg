@IsTest
private class AccountProcessorTest 
{
	@IsTest
    private static void testCountContactAsync()
    {
        System.debug('Test Start: ' + Datetime.now());
		
        Account a = new Account(name = 'test Account 1' );
		Insert a;
		Contact c = new Contact(AccountId = a.Id,lastname ='test last name 1');
		insert c;
        List<id> AccountIDs = new List<id>();
		AccountIDs.add(a.id);
        
        Test.startTest();
        	AccountProcessor.countContactsAsync(AccountIDs);
        Test.stopTest();
        System.debug('Test End: ' + Datetime.now());

    }
}