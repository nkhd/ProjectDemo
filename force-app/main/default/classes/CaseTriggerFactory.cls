/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-13-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CaseTriggerFactory {
    
    public static CaseTriggerHandlerInterface getCaseTriggerHandler(String context) {
        
        switch on context {
            
            when 'BEFORE_INSERT' {
                
                return new BeforeInsertCaseHnadlerService();

            }
            when 'BEFORE_UPDATE' {

                return new BeforeUpdateCaseHandlerService();
            }
            when else{
                return null;
            }
        }
        
    }
}
