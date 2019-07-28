public class HcCarePlansData {

    //assign to Mel
    
    public static void assignToMel() {
        List<Case> cases = [SELECT Id, OwnerId, OwnerName__c  FROM Case WHERE OwnerName__c  = 'Melinda Smith'];

        //query Mel ID
        User u = [SELECT Id, Name FROM User WHERE Name = 'Melinda Smith' LIMIT 1];
        Id uId = u.Id;

        List<Case> csUpd = New List<Case>();

        for (Case c: cases){
            c.OwnerId = uId;
            csUpd.add(c);
        }
        update csUpd;

    }
    //assign to Sally
    public static void assignToSally() {
        List<Case> cases = [SELECT Id, OwnerId, OwnerName__c FROM Case WHERE OwnerName__c  = 'Sally Agent'];

        //query Mel ID
        User u = [SELECT Id, Name FROM User WHERE Name = 'Sally Agent' LIMIT 1];
        Id uId = u.Id;

        List<Case> csUpd = New List<Case>();

        for (Case c: cases){
            c.OwnerId = uId;
            csUpd.add(c);
        }
        update csUpd;


    }

}