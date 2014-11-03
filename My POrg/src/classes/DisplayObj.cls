public class DisplayObj{

    public List<Object_1__c> lstO {get;set;}
    public Opportunity opp;
    Public Id oId;
    public Decimal countValidator;
    
    
    public PageReference updateCounter() {
       countValidator=Order_Counter__c.getInstance('CounterId').Counter_Validator__c;
       return null;
    }
    
    public DisplayObj(ApexPages.StandardController controller) {
        opp = (Opportunity) controller.getRecord();
        oId=opp.Id;
        lstO=[Select Id,Sales_Rep__c,TestArea__c from Object_1__c limit 1];
    }
    
    public PageReference checkSession() {
       
       if(Order_Counter__c.getInstance('CounterId').Counter_Validator__c==countValidator){
           Order_Counter__c csUpdate=Order_Counter__c.getInstance('CounterId');
           csUpdate.Counter_Validator__c++;
           update csUpdate; 
           return null;
       }else{
           apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'Record is already saved. Please refresh the page again');
           apexpages.addmessage(msg);
           return null;
       }
   }    
    
}