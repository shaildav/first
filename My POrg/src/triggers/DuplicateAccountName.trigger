trigger DuplicateAccountName on Account (before insert,before update) {

   Public Set<String> setAccountName= new set <string>();
 
   for(Account acc: [Select name from account limit 50000]){
       setAccountName.add(acc.Name);
   }

   for(Account objAcc:Trigger.New){
       if(setAccountName.contains(objAcc.Name)){
           objAcc.Name.addError('Account Name Already Exit');
           break;
       }
   } 

}