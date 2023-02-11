/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-11-2023
 * @last modified by  : eboutaout@salesforce.com
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