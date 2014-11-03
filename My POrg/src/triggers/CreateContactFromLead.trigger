trigger CreateContactFromLead on Lead (after insert) {

    Public List<Contact> lstContact = new List<Contact>();
    Public List<Lead> lstLead = new List<Lead>();
    
    for(Lead objLead: Trigger.New){
         if(objLead.company == 'Leadforcontact'){
         Account acc = [Select Id from Account where Name =: objLead.SICCode__c limit 1];
             Contact objContact = new Contact();
             objContact.FirstName = objLead.FirstName;
             objContact.LastName = objLead.LastName;
             objContact.Email = objLead.Email;
             objContact.MailingCity = objLead.City;
             objContact.MailingState = objLead.State;
             objContact.MailingCountry = objLead.Country;
             objContact.AccountId = acc.Id;
             lstContact.add(objContact);
         }
    }
    
    lstLead = [Select Id from Lead where Company = 'Leadforcontact'];
    try{
         insert lstContact;
         delete lstLead;
    }catch(Exception e){
            System.debug('In Catch'+e.getMessage());
    }   
    
}