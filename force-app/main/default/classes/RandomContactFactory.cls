public class RandomContactFactory 
{
	public static List<Contact> generateRandomContacts(Integer numContacts, String contactLastName) {
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i=0;i<numContacts;i++) {
            Contact a = new Contact(FirstName='Test FN' + i, LastName = contactLastName);
            contacts.add(a);
        }
        return contacts;
    }
    
}