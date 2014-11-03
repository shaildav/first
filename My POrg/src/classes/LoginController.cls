public class LoginController {

    public String uName{get;set;}
    public String uPass{get;set;}

    
    public LoginController() {

    }

        
    public Pagereference ConfirmLogin(){
        System.debug('uName------------------------------->'+uName);
        if(ValidateUser()){
            return new Pagereference('/https://www.facebook.com/');
        }else{
            return null;
        }
        
    }
    
    public Pagereference CheckLogin(){
        if(ValidateUser()){
            return new Pagereference('/https://www.facebook.com/');
        }else{
            return null;
        }
        
    }
    
    public Boolean ValidateUser(){
      /*  List<Login_User__c> lstUser=[Select Id, Name, userName__c, UserPass__c from Login_User__c Where UserName__c=:lu.userName__c AND UserPass__c=:lu.userPass__c limit 1];
        if(lstUser.size()>0){
            return true;
        }else{
            return false;
        }
        */
        return true;
    }
    
    
    public Pagereference CreateUser(){
        PageReference pageRef = new PageReference('/apex/Contact_Create');
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public Pagereference ResetPassword(){
        PageReference pageRef = new PageReference('/apex/Reset_Password');
        pageRef.setRedirect(true);
        return pageRef;
    }

}