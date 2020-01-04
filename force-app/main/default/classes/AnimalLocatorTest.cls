@isTest
public class AnimalLocatorTest 
{
	@isTest 
    static  void testGetCallout()
    {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String actualValue = AnimalLocator.getAnimalNameById(1);
        String expectedValue = 'chicken';
        System.assertEquals(actualValue, expectedValue);
    }
}