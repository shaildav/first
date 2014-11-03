public class CreateNewObj2Record {

    public Object_2__c obj;
    static PageReference pg;
    public CreateNewObj2Record(ApexPages.StandardController controller) {
        obj=(Object_2__c) controller.getRecord();
    }
    
    public PageReference SaveRecord(){
        insert obj;
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Warning,'Record Created Successfully.Thank you!'));
        return null;
    }

}