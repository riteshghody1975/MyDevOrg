@isTest
public class DailyLeadProcessorTest 
{
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @testSetup 
    static void setup() 
    {
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead( LastName='Test Lead'+i, Company = 'Test Company'
            ));
        }
        
        insert leads;
    }
    
    @isTest
    private static void testScheduledJob()
    {
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        List<Lead> lt = [SELECT Id 
            FROM Lead 
            WHERE LeadSource = null];
        System.assertEquals(200, lt.size(), '200 leads exists with leadsource null');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        lt = [SELECT Id 
            FROM Lead
            WHERE LeadSource = null];
        System.assertEquals(0, lt.size(), '0 leads exists with leadsource null');
               
    }

}