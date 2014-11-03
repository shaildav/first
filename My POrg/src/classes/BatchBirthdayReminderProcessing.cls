global class BatchBirthdayReminderProcessing implements Database.Batchable<sObject>{
    
    Public String queryString;
    Public List<Contact> lstContact=new List<Contact>();
    Public List<String> toAddresses = new List<String>();
    global Database.queryLocator start(Database.BatchableContext BC){      
        return Database.getQueryLocator(queryString);        
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
         /* 
                                            
         */        
         for(sObject s : scope){
            lstContact.add((Contact)s);  
         }
         
         for(Contact objCon: lstContact){ 
           if(Date.Today().day()== objCon.Birthdate.day() && Date.Today().Month() == objCon.Birthdate.Month()){
               toAddresses.add(objCon.email);
           }
         }
         
         if(toAddresses.ISEMPTY()) return;
           
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
         email.setToAddresses(toAddresses);
         List<String> ccAddresses = new List<String>();
         ccAddresses.add('decentshail@gmail.com');
         email.setCcAddresses(ccAddresses);
         email.setSubject('Happy Birthday. Have a blast -- Birthday Reminder!');
         String message = '<html><table cellspacing = "7"><tr><td style="font-weight:bold;color:green;">Happy Birthday!!!</td></tr><tr><td style="font-weight:bold;color:pink;">Many more Happy returns of the day.</td></tr><tr><td></td></tr><tr><td></td></tr><tr><td style="font-weight:bold;">Cheers,</td></tr><tr><td style="font-weight:bold;">Magulan D</td></tr></table></html>';
         email.setHtmlBody(message);
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
           
    //Send an email to the User after your batch completes
    global void finish(Database.BatchableContext BC){

    }
}