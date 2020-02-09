trigger MapAccountRecordType on Account (before Insert) {
    system.debug('Account Request Triggered');
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acct : Trigger.New) {
            system.debug(acct);
            system.debug(acct.Record_Type__c);
            if(acct.Record_Type__c != NULL){
                system.debug('Changing records in IF condition');
                Id newRecordTypeId = Account.sObjectType.getDescribe().getRecordTypeInfosByDeveloperName().get(acct.Record_Type__c).getRecordTypeId();
              acct.RecordTypeId = newRecordTypeId;
            }
        }
    }
}