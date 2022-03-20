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