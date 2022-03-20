/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class SendEmailDefaultService implements SendEmailServiceInterface{
    
    public void sendEmail(Contact c) {


        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    
        EmailTemplate emailTemplate = [Select Id,Subject,Description,Body, Markup  from EmailTemplate where DeveloperName =:EventBookingConfiguration.E2C_EMAIL_TEMPLATE];        
        OrgWideEmailAddress orgWideEmailAddress = [select Id from OrgWideEmailAddress where DisplayName=:EventBookingConfiguration.ORG_WIDE_EMAIL_ADDRESS ];

        String[] toAddresses = new String[] {c.email}; 
    
        //Change with Template ID
        mail.setTemplateId(emailTemplate.Id); 
        mail.setOrgWideEmailAddressId(orgWideEmailAddress.Id);
        mail.setToAddresses(toAddresses);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }

}
