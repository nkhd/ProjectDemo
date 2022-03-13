/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-13-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class BeforeUpdateCaseHandlerService implements CaseTriggerHandlerInterface {

    public void excuteHandler(Case request){
            
        Case r = [SELECT AccountId, Status FROM Case where id=:request.ID];
        if(r.Status == 'Closed'){
            ExternalSystemInterface service =  new ExternalSystemService(EventBookingConfiguration.WEB_SERVICE_NC,EventBookingConfiguration.EMAIL_SERVICE_SENDER);
            service.registerAttendees(r);
        }

    }

}
