trigger CheckSCActivityField on Task (before update) {
        
        Schema.DescribeFieldResult field = Task.fields.Activity_Type__c.getDescribe();
        public List<Schema.PicklistEntry> picklist = field.getPicklistValues();
        public Boolean flag = false;
                
        for(Task tsk : Trigger.New){
            for(Integer i=0;i<picklist.size();i++){
                if(tsk.Activity_Type__c == picklist[i].getvalue()) {
                    flag = true;
                    break;           
                }
            }
            if(!flag){
                tsk.Activity_Type__c.addError('Activity Type is removed from Picklist please select another');
            }             
        }
            
             
}