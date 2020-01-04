public class AccountProcessor {

    @future
    public static void countContactsAsync(List<id> AccountIDs)
    {
        System.debug('Start: ' + Datetime.now());

        List<Account> accounts = new List<Account>();
        AggregateResult[] groupedContactResults = [select count(ID) cnt, AccountID from contact where AccountID in :AccountIDs Group by AccountID];
        //System.debug(groupedContactResults);
        for (AggregateResult ar : groupedContactResults)  
        {
        	accounts.add( new Account(
                						id = (id)ar.Get('AccountID'), 
                						Number_of_Contacts__c = (Decimal)ar.Get('cnt')
            						)
                        );
		}
		update accounts;
        System.debug('End: ' + Datetime.now());
    }
}