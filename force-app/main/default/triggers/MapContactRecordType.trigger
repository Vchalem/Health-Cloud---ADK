trigger MapContactRecordType on Contact (before insert) {
    system.debug('Contact Request Triggered');
    if(Trigger.isBefore && Trigger.isInsert){
        for(Contact cont : Trigger.New) {
            system.debug(cont);
            system.debug(cont.Record_Type__c);
            if(cont.Record_Type__c != NULL){
                system.debug('Changing records in IF condition');
                Id newRecordTypeId = Contact.sObjectType.getDescribe().getRecordTypeInfosByDeveloperName().get(cont.Record_Type__c).getRecordTypeId();
                cont.RecordTypeId = newRecordTypeId;
            }
        }
    }
}