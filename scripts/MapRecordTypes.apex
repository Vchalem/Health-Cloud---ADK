try {
    Map<String, Schema.RecordTypeInfo> accountRecordTypes = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName();

    List<Account> accountList = New List<Account>(); 

    for (Account acct : [SELECT Record_Type__c, RecordTypeId FROM Account]){
        if(acct.Record_Type__c != NULL){
            acct.RecordTypeId = accountRecordTypes.get(acct.Record_Type__c).getRecordTypeId();
            accountList.add(acct);
        } 
    }
    update accountList;
}
catch(Exception e){
    system.debug(e);
}
