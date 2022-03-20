/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class BeforeInsertCaseHandlerServiceTest {
    
    @isTest
    public static void refuseCaseCreationWhenAnAccountIsNotAttachedToACase(){
        // Given

        Case request = new Case(Origin = 'Phone',Subject = 'Event Booking', Description = 'Book Spots');
        
        // When 

        System.Test.startTest();

        Database.SaveResult result = Database.insert(request, false);

        System.Test.stopTest();

        // Then

        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('You cannot create a request without attaching an account',
        result.getErrors()[0].getMessage());
    }
    
    @isTest
    public static void refuseCaseCreationWhenNoContactIsAttachedToAnAccount(){
        // Given
  
        Account a1 = new Account(Name = 'Salesforce');
        Contact con1 = new Contact(FirstName='Fn1',LastName='Ln1');
        Contact con2 = new Contact(FirstName='Fn2',LastName='Ln2');
        Contact con3 = new Contact(FirstName='Fn3',LastName='Ln3');
        Contact con4 = new Contact(FirstName='Fn4',LastName='Ln4');
        insert a1;

        con1.AccountId = a1.Id;
        con2.AccountId = a1.Id;
        con3.AccountId = a1.Id;
        con4.AccountId = a1.Id;

        List<Contact> contacts = new List<Contact>();
        contacts.add(con1);
        contacts.add(con2);
        contacts.add(con3);
        contacts.add(con4);

        insert contacts;

        Case request = new Case(Origin = 'Phone',Subject = 'Event Booking', Description = 'Book Spots', AccountId = a1.ID);
        
        // When 

        System.Test.startTest();

        Database.SaveResult result = Database.insert(request, false);

        System.Test.stopTest();

        // Then

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('You cannot create a request for accounts without contacts',
        result.getErrors()[0].getMessage());
    }

    @isTest
    public static void refuseEventBookingWhenNumberOfAttendeesIsMoreThanOneForWebCases(){
        // Given
        
        Account a1 = new Account(Name = 'Salesforce');
        insert a1;
        
        Contact c1 = new Contact(LastName = 'Contact 1', AccountId = a1.ID);
        insert c1;

        Contact c2 = new Contact(LastName = 'Contact 2', AccountId = a1.ID);
        insert c2;

        Contact c3 = new Contact(LastName = 'Contact 3', AccountId = a1.ID);
        insert c3;

        Case request = new Case(Origin = 'Web',Subject = 'Event Booking', Description = 'Book Spots for Company A1 & their 3 employees', AccountId = a1.ID);
        
        // When 

        System.Test.startTest();

        Database.SaveResult result = Database.insert(request, false);

        System.Test.stopTest();

        // Then

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Web request are only allowed to have one attendee',
        result.getErrors()[0].getMessage());

            
    } 
    
}
