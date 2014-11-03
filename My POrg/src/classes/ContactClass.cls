public with sharing class ContactClass{

    public Contact con{get;set;}
    public List<String> characters;
    public String input {get; set;}
    public String char1;
    public String char2;
    public String char3;
    public String char4;
    public String char5;
    public String char6;
    public captcha objCH = new captcha();
    
    public ContactClass(ApexPages.StandardController controller) {
        con = (Contact) controller.getRecord();
    }
       
    public pagereference doSave(){
        if(objCH.validate()){
           insert con;
        
        List<Contact> lstContact =[select id,Email from Contact order by createdDate desc limit 1]; 
        String emailId = lstContact[0].Email; 
        String password = emailId.substring(0,4) +string.valueOf(System.today()); 
        
        Contact objUpdate = new Contact(id=con.id);
        objUpdate.Password__c = password ;     
        update objUpdate;                           
                                  
        string smail= '<html><table ><tr><td colspan=\"2\">Please find your login details</td></tr><tr><td>User Name</td><td>'+ lstContact[0].Email +'</td><td></td></tr><tr><td>Password</td><td>'+ password +'</td></tr>';
        List<String> lstEmails = new List<String>();       
        if(lstContact[0].Email != null){
             lstEmails.add(lstContact[0].Email); 
        }
                
                system.debug('---->'+lstEmails); 
                                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
                                String[] toAddresses = lstEmails;   
                                mail.setToAddresses(toAddresses); 
                                mail.setSenderDisplayName('Contact Created'); 
                                mail.setBccSender(true);  
                                mail.setPlainTextBody(smail); 
                                mail.setHtmlBody(smail);
                                mail.setTargetObjectId(con.Id); 
                                
                              
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
                     
        return (new pagereference('/003/o').setredirect(true));
    }else{
        con.addError('Intered Characters not matched with Image');
        return null;
    }
 }
 
 }