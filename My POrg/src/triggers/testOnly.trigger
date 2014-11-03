trigger testOnly on Contact (before insert, before update) {
     for(Contact con:Trigger.New){
         System.debug('con Account Name:-------->'+con.Account.Name);
     }
}