@isTest
public class AddPrimaryContactTest 
{
	@testSetup 
    static void setup() 
    {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState='NY'
            ));
        }
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+ i + 50, BillingState='CA'
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        
        
        Contact c = new Contact(LastName = 'Contact CA');
       
        AddPrimaryContact updater = new AddPrimaryContact(c, 'CA');
       
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        
        System.assertEquals(50, [select count() from contact where LastName = :c.LastName]);
    }
}