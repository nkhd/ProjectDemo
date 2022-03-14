/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CaseTrigger on Case (before insert,before update) {

    Case r = Trigger.new[0];
    CaseTriggerFactory.createCaseTriggerHandler().excuteHandler(r);

}