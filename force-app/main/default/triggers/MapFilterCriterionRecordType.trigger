trigger MapFilterCriterionRecordType on HealthCloudGA__FilterCriterion__c (before insert) {
    system.debug('Contact Request Triggered');
    if(Trigger.isBefore && Trigger.isInsert){
        for(HealthCloudGA__FilterCriterion__c fc : Trigger.New) {
            system.debug(fc);
            system.debug(fc.Record_Type__c);
            if(fc.Record_Type__c != NULL){
                system.debug('Changing records in IF condition');
                Id newRecordTypeId = HealthCloudGA__FilterCriterion__c.sObjectType.getDescribe().getRecordTypeInfosByDeveloperName().get(fc.Record_Type__c).getRecordTypeId();
                fc.RecordTypeId = newRecordTypeId;
            }
        }
    }
}