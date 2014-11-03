trigger PreventDuplicateCaseCreated on Case (before insert, after insert) {

        
        if(Trigger.isBefore){
            Map<Id,Case> mapCaseDetail=new Map<Id,Case>([Select Id, Subject from Case where Status != 'Closed']);
            Set<String> setEmailSubject=new Set<String>();
            
            
         
            
            for(Case objCse: mapCaseDetail.values()){
               setEmailSubject.add(objCse.Subject);
            }            
            
            List<aggregateResult> results = [Select Subject, COUNT(ID) aver from Case where Subject IN: setEmailSubject  
                                              group by Subject Having count(ID) > 0];

            Object c=results[0].get('aver');
            System.debug('1--------------------->'+c);
            
            for(Case ObjC: Trigger.New){
                if(objC.Subject != null){
                    String Subject= objC.Subject.substring(4);
                    if(setEmailSubject.contains(Subject) || setEmailSubject.contains(objC.Subject)){
                        ObjC.addError('Email already in Process');
                    }
                }    
            }
        }
}