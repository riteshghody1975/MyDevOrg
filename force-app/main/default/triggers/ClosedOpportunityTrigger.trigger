trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{
    List<Task> newTaskList = new List<Task>();
    
    for(Opportunity opp : Trigger.New)
    {
        if(opp.StageName == 'Closed Won')
        {
            newTaskList.add(new Task(
                						Subject ='Follow Up Test Task',
                						WhatID = opp.Id
            						)
                           );
        }
    }
    insert newTaskList;
}