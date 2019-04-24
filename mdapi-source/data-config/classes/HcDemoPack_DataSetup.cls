//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       HcDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘

public class HcDemoPack_DataSetup {

    public static void preSetupForDemoData() {

        // Pre-setup: Enable Person Account
        // Required otherwise PersonAccount records will not be marked as "Individual" (in FinServ__IndividualType__c) 
        enablePersonAccountRecordType();
   
    }

    public static void enablePersonAccountRecordType(){
        //Enable Person Account in https://developer.salesforce.com/docs/atlas.en-us.health_cloud.meta/health_cloud/admin_enable_person_account.htm
        try {
            HealthCloudGA__UsePersonAccount__c upa = [SELECT Id, Name FROM HealthCloudGA__UsePersonAccount__c WHERE Name ='Use Person Account'];
            upa.HealthCloudGA__Enable__c = true;
            update upa;
        } catch(System.DmlException e) {
            System.debug (e.getMessage());
        }
        
    }
  
}