trigger createObjectBRecords on Object_1__c(after insert){

    List<Object_2__c> lstObjectBToCreated = new List<Object_2__c>();
    
    for(Object_1__c obj:Trigger.New){
        for(Integer a = 0; a <=obj.Start_Date__c.daysBetween(obj.End_Date__c); a++){
            Object_2__c objB=new Object_2__c();
            objB.Date__c=obj.Start_Date__c+a;
            objB.Instructor_Number__c=obj.Instructor_Number__c;
            lstObjectBToCreated.add(objB);
        }
    }
    if(!lstObjectBToCreated.ISEMPTY()){
        insert lstObjectBToCreated;
    }
}