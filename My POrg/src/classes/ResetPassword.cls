public class ResetPassword {

    public Contact Con{get;set;}
    
    public ResetPassword(ApexPages.StandardController controller) {
         Con = (Contact) controller.getRecord();
    }
    
     public Boolean IsUserExit(){
        List<Contact> lstCon = [Select Id from Contact Where UserName__c =: Con.UserName__c];
        if(lstCon.size()>0)
            return true;
        else
            return false;    
    }
    
    public Pagereference ResetPassword(){
        PageReference ref;
        if(IsUserExit()){
            insert Con;
            String usrname = Con.Email; 
            String password = usrname.substring(0,4) +string.valueOf(System.today()); 
            Con.UserName__c = Con.Email;
            Con.Password__c = password;
            update Con;
            ref = new PageReference('/apex/Success');
            ref.setRedirect(true);
            return ref;
        }else{
            Con.addError('Invalid User');
            return null;
        }
    }

}