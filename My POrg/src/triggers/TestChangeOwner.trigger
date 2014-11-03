trigger TestChangeOwner on Object_1__c (before update) {
    for(Object_1__c obj:Trigger.New){
        obj.OwnerId='00590000000xgTN';
    }
}