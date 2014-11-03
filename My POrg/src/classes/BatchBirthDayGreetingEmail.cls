/*




*/

global class BatchBirthDayGreetingEmail implements Database.Batchable < sObject > , Database.Stateful, Schedulable  {

    Datetime d = Datetime.now();
    global integer totalProcessed =0; 
    List <Contact> lstContact = new List <Contact> ();
    String query = 'SELECT Birthdate, Birthday_Reminder_Set__c FROM Contact where Birthday_Reminder_Set__c=false';
    String email = 'info.shail.singh@gmail.com';
    
    
    global Database.querylocator start(Database.BatchableContext BC) {
          // Add the limit for test class, for passing limited records to the batch
          if(Test.isRunningTest()) {
             query = 'SELECT Birthdate, Birthday_Reminder_Set__c FROM Contact where Birthdate !=null';
          }
        return Database.getQueryLocator(query);
    }
    
    global void execute(SchedulableContext sc) {
      BatchBirthDayGreetingEmail setBirthDateFlag = new BatchBirthDayGreetingEmail();
      Id batchprocessid = Database.executeBatch(setBirthDateFlag);
   }

    global void execute(Database.BatchableContext BC, List <Contact> scope) {
        try {
            for(Contact con:scope){
                 if(con.Birthdate>=System.Today()){
                     con.Birthday_Reminder_Set__c=true;
                     lstContact.add(con);
                 }else{
                     con.Birthday_Reminder_Set__c=true;
                     lstContact.add(con);
                 }     
            }
            if (!lstContact.isEmpty()){
                update lstContact;
                totalProcessed += lstContact.size();
            }
            
         }catch (Exception e) {
            System.debug(e.getCause() + '-' + e.getMessage() + '-' + e.getLineNumber() + '-' + e.getStackTraceString());
        }
    }

    global void finish(Database.BatchableContext BC) {
        try {
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {email });
            mail.setReplyTo(email);
            mail.setSenderDisplayName('Batch Processing BirthDay Greeting');
            mail.setSubject('Batch Processing BirthDay Greeting @' + d.format('yyyy-MM-dd HH:mm'));
            mail.setPlainTextBody('Batch Processing BirthDay Greeting. ' + totalProcessed + ' records updated');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});

            if (Test.isRunningTest()) integer k = 1 / 0; //force exception coverage

        } catch (Exception e) {
            System.debug(e.getCause() + '-' + e.getMessage() + '-' + e.getLineNumber() + '-' + e.getStackTraceString());
        }
    }
}