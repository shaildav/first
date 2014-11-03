global class ScheduleBatchBirthdayReminder implements Schedulable{

    global void execute(SchedulableContext SC) {
    
      
        //initialize object of BatchCleanUpMultipleTerrOnAccount batch class
        BatchBirthdayReminderProcessing batchBirthdayReminder = new BatchBirthdayReminderProcessing();

        //setting query string to loop through all account records
        batchBirthdayReminder.queryString = 'SELECT EMail,Birthdate FROM contact';     
        
        //call execute method of batch
        Database.executeBatch(batchBirthdayReminder);
        
    }
}