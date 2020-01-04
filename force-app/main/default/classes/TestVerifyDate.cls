@isTest
private class TestVerifyDate 
{
	@isTest
    static void testDateWithin30Days_Date2LessThenDate1()
    {
        Date date1 = Date.newInstance(2019,01,01);
        Date date2 = Date.newInstance(2018,1,1);
        Date result = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Date.newInstance(2019,01,31), result);
    }
    
    @isTest
    static void testDateWithin30Days_Date2GreaterThen30Days()
    {
        Date date1 = Date.newInstance(2019,01,01);
        Date date2 = Date.newInstance(2019,2,01);
        Date result = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Date.newInstance(2019,01,31), result);
    }
    
    @isTest
    static void testDateWithin30Days_Date2GreaterbyEqual30Days()
    {
        Date date1 = Date.newInstance(2019,01,01);
        Date date2 = Date.newInstance(2019,1,31);
        Date result = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Date.newInstance(2019,01,31), result);
    }
    
     @isTest
    static void testDateWithin30Days_Date2GreaterThenDate1()
    {
        Date date1 = Date.newInstance(2019,01,01);
        Date date2 = Date.newInstance(2019,1,15);
        Date result = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(Date.newInstance(2019,01,15), result);
    }
}