global class batchOpportunityDelete implements Database.Batchable<sObject>{
    global final String Query;
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,List<Opportunity> scope){
        delete scope;
    }
    
    global void finish(Database.BatchableContext BC){
    }
}