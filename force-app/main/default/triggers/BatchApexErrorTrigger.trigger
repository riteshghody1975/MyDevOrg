trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) 
{
	List<BatchLeadConvertErrors__c> objList = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent thisObj : Trigger.New)
    {
        BatchLeadConvertErrors__c blce = new BatchLeadConvertErrors__c (
                                                                            AsyncApexJobId__c = thisObj.AsyncApexJobId ,
                                                                            Records__c = thisObj.JobScope,
                                                                            StackTrace__c = thisObj.StackTrace
                                                                        );
        objList.add(blce);
    }
    insert objList;
}