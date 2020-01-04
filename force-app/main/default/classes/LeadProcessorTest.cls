@isTest
private class LeadProcessorTest 
{
	@testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        
        // insert 200 Leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='Lead '+i, 
                Company='Company'));
        }
        insert leads;
    }
    
    @isTest
	private static void test() 
    {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where Leadsource = 'Dreamforce']);
    }    
}