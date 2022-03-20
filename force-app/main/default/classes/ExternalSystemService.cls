/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ExternalSystemService implements ExternalSystemInterface {

    private String webServiceURL;
    private String emailServiceType;

    public ExternalSystemService(String webServiceURL,String emailServiceType){
        System.assert(String.isNotEmpty(webServiceURL),'Cannot accept a null or an empty web Service URL');
        System.assert(String.isNotEmpty(emailServiceType),'Cannot accept a null service type');

        this.webServiceURL = webServiceURL;
        this.emailServiceType = emailServiceType;
    }

    public void registerAttendees(Case r){
            for(Account a : [SELECT id FROM Account where id = :r.AccountId]){
                for(Contact c : [SELECT id,name, email FROM Contact where accountid =: a.id ]){

                    HttpResponse response = brodcatsRegistrationEvent(c.name,c.email);
                    Integer status = response==null ? 0 : response.getStatusCode();
                    switch on status {
                        when 201 {
                            notifyAttendeeByEmail(c);
                        }
                        when else {
                            System.debug(LoggingLevel.INFO,'The status code returned was not expected: ' +
                            response.getStatusCode() + ' ' + response.getStatus());
                        }
                    }

                }
            
        }
    } 

    private void notifyAttendeeByEmail(Contact account){

        try{
            SendEmailServiceInterface sendEmailService = EmailServiceFactory.getEmailService(emailServiceType);
            sendEmailService.sendEmail(account);
        }    
        catch(Exception e){
            System.debug(LoggingLevel.INFO,'Cannot send email to attendee cause of : ' + e.getMessage());
        }

    } 

    private HttpResponse brodcatsRegistrationEvent(String name,String email){

        if(String.isNotEmpty(name) && String.isNotEmpty(name)){

            HttpCalloutService service = new HTTPCalloutService(this.webServiceURL);
            service.setRequestBody('{"name":"'+ name + '-' + email  +'}');            
            HttpResponse response = service.sendRequest();
            return response;
            
        }

        throw new BrodcatsRegistrationEventException();

    }

}