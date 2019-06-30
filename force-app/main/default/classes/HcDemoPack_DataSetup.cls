//─────────────────────────────────────────────────────────────────────────────────────────────────┐
/**
 * @class       HcDemoPack_DataSetup
 * @description Implements a collection of static methods that can be used to create demo data.
 * @version     1.0.0
 * @public
 */
//─────────────────────────────────────────────────────────────────────────────────────────────────┘
public class HcDemoPack_DataSetup {

//create users 
    public static void createMel() {
      //query for profile
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Health Cloud Care Coordinator' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Smith';
      usr.FirstName='Melinda';
      usr.Alias='melsmith';
      usr.Email = 'msmith@example.com';
      usr.Username='melindasvi0xy' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]

   
    }
    public static void createCharles() {
      //query for profile -- need his actual profile..
      Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Health Cloud Care Coordinator' LIMIT 1];
      
      //generate random username
      Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));

      User usr = new User();
      usr.LastName = 'Charles';
      usr.FirstName='Green';
      usr.Alias='cgreen';
      usr.Email = 'cgreen@example.com';
      usr.Username='cgreenvi0xy' + randomInt + '@myscratch.com.org';
      usr.ProfileId = profileId.id;
      usr.TimeZoneSidKey = 'GMT';
      usr.LanguageLocaleKey = 'en_US';
      usr.LocaleSidKey = 'en_US';
      usr.EmailEncodingKey = 'UTF-8';

      insert usr; 

      //permsets: ["HealthCloudPermissionSetLicense", "HealthCloudAdmin"]

   
    }

    public static void createPeter(){

    } 
    public static void createSally(){
        
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