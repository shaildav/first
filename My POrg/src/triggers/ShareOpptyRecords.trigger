trigger ShareOpptyRecords on Opportunity(after insert,after update){

       public Set<Id> opptyId=new set<Id>();
       public Map<Id,List<Object_1__c>> mapOpptWithO= new Map<Id,List<Object_1__c>>();
       
       for(Opportunity opp:Trigger.New){
           if((Trigger.isInsert && opp.ShareWithRep__c) || (opp.ShareWithRep__c && opp.ShareWithRep__c != Trigger.oldMap.get(opp.Id).ShareWithRep__c)){
                  opptyId.add(opp.Id);
           }
       }
       System.debug('opptyId----------->'+opptyId);
       
       List<Object_1__c> lstOB = [Select Id,Opportunity__c,Sales_Rep__c from Object_1__c where Sales_Rep__c != null AND Opportunity__c IN: opptyId];
       System.debug('lstOB ----------->'+lstOB);
        
       for(Object_1__c objOO: lstOB){
           List<Object_1__c> temp= new List<Object_1__c>();
           temp.add(objOO);
           if(!mapOpptWithO.containskey(objOO.Id)){
               mapOpptWithO.put(objOO.Opportunity__c,temp);
           }else{
               mapOpptWithO.get(objOO.Opportunity__c).add(objOO);
           }
       }
       System.debug('mapOpptWithO----------->'+mapOpptWithO);
       
       List<EntitySubscription> allFollowers = new List<EntitySubscription>();    
       for(Id id: opptyId){
          System.debug('mapOpptWithO.get(id)------------>'+mapOpptWithO.get(id));
          if(mapOpptWithO.get(id) != null){
             for(Object_1__c objA: mapOpptWithO.get(id)){
                 EntitySubscription e = new EntitySubscription();        
                 e.parentId = id;        
                 e.subscriberid = objA.Sales_Rep__c;        
                 allFollowers.add(e);
             }
          }     
       } 
       insert allFollowers;
       System.debug('allFollowers ----------->'+allFollowers);     
}