/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CaseTriggerFactory {
    

    public static CaseTriggerHandlerInterface createCaseTriggerHandler() {
        
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                
                return new BeforeInsertCaseHnadlerService();

            }
            when BEFORE_UPDATE {

                return new BeforeUpdateCaseHandlerService();
            }
            when else{
                throw new NoSuchElementException();
            }
        }
        
    }
}

 @isTest
    public static void refuseCaseCreationWhenNoContactIsAttachedToAnAccount(){
        // Given
  
        /*Account a1 = new Account(Name = 'Salesforce');
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

        insert contacts;*/
        
        // When 

        System.Test.startTest();

        Account a1 = new Account(Name = 'Salesforce');
        Contact con1 = new Contact(FirstName='Fn1',LastName='Ln1');
        Contact con2 = new Contact(FirstName='Fn2',LastName='Ln2');
        Contact con3 = new Contact(FirstName='Fn3',LastName='Ln3');
        Contact con4 = new Contact(FirstName='Fn4',LastName='Ln4');

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
		Database.SaveResult result = Database.insert(request, false);

        
        System.Test.stopTest();

        // Then

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        //System.assertEquals('You cannot create a request for accounts without contacts',result.getErrors()[0].getMessage());
    }