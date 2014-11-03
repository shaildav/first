public with sharing class populateList {

    public List<Account> lstAccount {get;set;}
    
    public populateList(ApexPages.StandardController controller) {
   
        
    }
    
    public Pagereference populateAccountList(){
    
          lstAccount = [Select Name from Account];
          return null;
    }
  

}