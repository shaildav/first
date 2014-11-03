public class AccountClassUtility {

    public Integer x{get;set;}
    public Integer y{get;set;}
    public Integer z{get;set;}
    public Integer Sum{get;set;}
    
    public AccountClassUtility(ApexPages.StandardController controller) {
        x=0;y=0;z=0;
        Sum=x+y+z;
        SYstem.debug('Sum------------------------------->'+Sum);
    }
    
    public Pagereference sumTheNumber(){
        Sum=x+y+z;
        SYstem.debug('Sum------------------------------->'+Sum);
        return null;
    }

}