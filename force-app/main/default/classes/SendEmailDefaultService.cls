/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-13-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class SendEmailDefaultService implements SendEmailServiceInterface{
    
    public void sendEmail(Contact c) {

        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        String[] toAddresses = new String[] {c.email}; 
        
        mail.setToAddresses(toAddresses);

        mail.setReplyTo('support@acme.com');
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('New Case Created : ' + c.Id);
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody('Your Case: ' + c.Id +' has been created.');
        mail.setHtmlBody('Your case:<b> ' + c.Id +' </b>has been created.<p>'+
            'To view your case <a href=https://yourInstance.salesforce.com/'+case.Id+'>click here.</a>');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }

}
