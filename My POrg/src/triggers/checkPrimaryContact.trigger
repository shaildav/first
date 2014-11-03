trigger checkPrimaryContact on Contact (before insert, before update){

    
    public Set<Id> setAccountId=new Set<Id>();
    
    for(Contact con: Trigger.New){
        if(con.Active__c && con.AccountId!=null){
            setAccountId.add(con.AccountId);
        }
    }

    for(Contact con: [Select Id, Active__c from Contact where AccountId IN: setAccountId]){
        con.Active__c.addError('Primary Contact already exist for this Account');
    }
}