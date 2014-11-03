public with sharing class extSendSMS {
    public Task task {get;set;}
    public String endpoint {get;set;}
    private Contact contact;

    public extSendSMS(ApexPages.StandardController stdController) {
        this.contact = (Contact)stdController.getRecord();
        this.contact = [select id, MobilePhone from Contact where Id=:contact.id];
        this.task = new Task();
        this.task.WhoId = contact.Id;
        this.task.type = 'SMS';
        this.task.ActivityDate = Date.Today();

        this.task.status = 'Completed';
    }
    public PageReference sendSMS(){
        this.task.subject = 'SMS: ' + this.task.Description;
        insert task;
        String strippedMobilePhone = '';
        strippedMobilePhone = this.contact.mobilePhone;
        strippedMobilePhone = strippedMobilePhone.replaceAll('[^0-9]', '');
        endpoint = 'http://localhost:8565/'+ strippedMobilePhone +'/'+ this.task.Description;
        return new PageReference('/'+contact.Id);
    }
}