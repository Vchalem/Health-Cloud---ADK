//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       FscDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
public class HCDemoPack_DataSetup {

    public static void preSetupForDemoData() {
        // Pre-setup: ENable Person Account
        // Separating it because Custom Setting doesn't show in records below if inserted in same transaction
        // - Add record in FinServ__UsePersonAccount__c  Custom Setting
        // - CUstom Metadata type will be uploaded with other metadata
        // - Required otherwise PersonAccount records will not be marked as "Individual" (in FinServ__IndividualType__c) and can't be used in Financial Goal
        
        
        enablePersonAccountRecordType();
   
    }
}