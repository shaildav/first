public class AdminUtility {

    
    Public List<User> lstUser {get;set;}   
    Public List<uUser> lstuUser {get;set;}
    Public String firstName{get;set;}
    Public String email{get;set;}
    Public Boolean showUserDetail{get;set;}
    Public List<User> lstUserToSendMail=new List<User>();
    
    public PageReference searchUser() {
        String conditions = '';
        String SOQLString='Select Id, Name, Email, Profile.Name, UserName, IsActive from User';
        
        if (firstName!= null && firstName != '')
            conditions += ' Name LIKE \'' + firstName + '%\'';
            
        if (email != null && email != ''){
            if (conditions != '') conditions+= ' and ';
                conditions += ' Email = \'' + email + '\'';
        }
        
        if (conditions != '')
            SOQLString += ' where ' + conditions;
        
        SOQLString += ' limit 1000';    
        System.debug('SOQLString ------------------------>'+SOQLString);
        lstUser=Database.query(SOQLString); 
        lstuUser = new List<uUser>();
        for(User u:lstUser){           
            lstuUser.add(new uUser(u));
        }        
        System.debug('lstUser ---------------------------->'+lstUser);
        showUserDetail = lstUser.size()>0?true:false;
        return null;
    }

    public PageReference InactivateUser() {
        List<User> lstUserToInactive=new List<User>();
        for(uUser u:lstuUser){
            if(u.selected){
                u.us.IsActive=false;
                lstUserToInactive.add(u.us);
            }
            u.selected=false;
        }
        if(!lstUserToInactive.ISEMPTY()){
            update lstUserToInactive;
        }
        return null;
    }

    public PageReference ActivateUser() {
        List<User> lstUserToInactive=new List<User>();
        for(uUser u:lstuUser){
            if(u.selected && !u.us.IsActive){
                u.us.IsActive=true;
                lstUserToInactive.add(u.us);
            }
            u.selected=false;
        }
        if(!lstUserToInactive.ISEMPTY()){
            update lstUserToInactive;
        }
        return null;
    }

    public PageReference ResetPassword() {
        for(uUser u:lstuUser){
            if(u.selected){
             System.setPassword(u.us.Id,'Infa@1234');
             // System.resetPassword(u.us.Id, true);
              lstUserToSendMail.add(u.us);
            }
            u.selected=false;
        }
        sendEmailForResetPassword(lstUserToSendMail);
        return null;
    }
    
    public void sendEmailForResetPassword(List<User> u){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        String userEmail;
        for(User user: u){
            if(user.Email !='' && user.Email !=null)
                userEmail=user.Email;
        }
        String[] toAddresses = new String[] {userEmail}; 
        mail.setToAddresses(toAddresses);
        mail.setSubject('Salesforce Password Reset');
        mail.setPlainTextBody('Your Salesforce Password is reset. Your New Password is Infa@123');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
   
    public class uUser{
        public User us {get; set;}
        public Boolean selected {get; set;}

        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false
        public uUser(User u) {
            us = u;
            selected = false;
        }
    }
}