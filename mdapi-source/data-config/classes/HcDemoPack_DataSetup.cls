//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       FscDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
public class HcDemoPack_DataSetup {

  // Get the RecordType IDs for this org.
  //public static Map<String,RecordType> recordTypes = getFscRecordTypeIds();

    public static void preSetupForDemoData() {
        // Pre-setup: ENable Person Account
        // Separating it because Custom Setting doesn't show in records below if inserted in same transaction
        // - Add record in FinServ__UsePersonAccount__c  Custom Setting
        // - CUstom Metadata type will be uploaded with other metadata
        // - Required otherwise PersonAccount records will not be marked as "Individual" (in FinServ__IndividualType__c) and can't be used in Financial Goal
        
        
        enablePersonAccountRecordType();
   
    }

    public static void enablePersonAccountRecordType(){
        //Enable Person Account in https://developer.salesforce.com/docs/atlas.en-us.health_cloud.meta/health_cloud/admin_enable_person_account.htm
        //Insert record in Custom Setting
        try{
            //Map<String_dataset_name, CustomSettingName__c> mcs = CustomSettingName__c.getAll();

            //CustomSettingName__c usPA = SELECT Name, Enable from CustomSettingName__c WHERE Name-'Use Person Account';


            HealthCloudGA__UsePersonAccount__c upa = [SELECT Id, Name FROM HealthCloudGA__UsePersonAccount__c WHERE Name ='Use Person Account'];
            upa.HealthCloudGA__Enable__c = true;
            update upa;
        }catch(System.DmlException e){
            System.debug (e.getMessage());
        }
        
    }
  
}