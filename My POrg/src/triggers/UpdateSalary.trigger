trigger UpdateSalary on Master_Object__c (before insert, before update) {

    for(Master_Object__c objMs: Trigger.New){
        objMs.Source__c = 'Test';
    }
    
}