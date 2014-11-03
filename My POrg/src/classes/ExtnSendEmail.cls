public with sharing class ExtnSendEmail {

    private final Opportunity Opp;
    List<Contact> lstContact = new List<Contact>();
    
    public ExtnSendEmail(ApexPages.StandardController controller) {
        this.Opp=(Opportunity)controller.getRecord();
        sendEmail();
    }
    
    public void SendEmail(){
        lstContact = [Select Id,Email from Contact where Opportunity__c =: opp.Id];
        for(Contact objCon :lstContact){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(objCon.Id);
            mail.setTemplateId('00X90000000TZGy');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
   }


}