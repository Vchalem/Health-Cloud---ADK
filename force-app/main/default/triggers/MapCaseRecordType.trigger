trigger MapCaseRecordType on Case (before Insert) {
    system.debug('Account Request Triggered');
    if(Trigger.isBefore && Trigger.isInsert){
        for(Case c : Trigger.New) {
            system.debug(c);
            system.debug(case.Record_Type__c);
            if(c.Record_Type__c != NULL){
                system.debug('Changing records in IF condition');
                Id newRecordTypeId = Case.sObjectType.getDescribe().getRecordTypeInfosByDeveloperName().get(c.Record_Type__c).getRecordTypeId();
                c.RecordTypeId = newRecordTypeId;
            }
        }
    }
}