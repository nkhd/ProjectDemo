/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-13-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class EmailServiceFactory {
    
    public static SendEmailServiceInterface getEmailService(String type){

        switch on type {
            when 'Custom' {
                return null;
            }
            when else {
                return new SendEmailDefaultService();
            }
        }


    }


}
