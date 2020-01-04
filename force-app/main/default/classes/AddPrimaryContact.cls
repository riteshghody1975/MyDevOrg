public class AddPrimaryContact implements Queueable 
{ 
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact,String state)
    {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) 
    { 
        List<Account> accList = [Select id from Account where Billingstate= :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();
        for(Account a: accList)
        {
            Contact newContact = contact.clone();
            newContact.AccountID = a.ID;
            contacts.Add(newContact);	
        }
        insert contacts;
    }
    
}