public class MyCustomControler{ 
    public List<Account> acct {get;set;}
    public Integer expression {get;set;}
    
    public MyCustomControler(){ 
        acct=new List<Account>();
    }

  
    public PageReference submitQuery(){ 
        acct=Database.query('Select Name, Phone, Industry, Rating from Account limit '+expression);
        return null;
    }
    
}