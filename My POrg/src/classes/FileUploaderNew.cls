public class FileUploaderNew{


    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<User> newUserList = new List<User>();
    Map<String,Profile> mapUser=new Map<String,Profile>();
    
    public FileUploaderNew(){

    }
    
  
    public Pagereference ReadFile(){
        
        nameFile=EncodingUtil.base64Encode(contentFile);
        System.debug('nameFile**************************************'+nameFile);
        filelines = nameFile.split('\n');
                
        Profile lstProfile = [Select Id FROM Profile WHERE Name = 'Chatter Free User'];
        
        for (Integer i=0;i<filelines.size();i++){
           System.debug('****************Jai Hi **********************');
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            String pId=inputvalues[0].replaceAll('\r\n',' ');
            
            Database.DMLOptions dmo = new Database.DMLOptions();
            dmo.EmailHeader.triggerUserEmail = true; 
            User newUser = new User();
            newuser.Email = inputvalues[0];
            newuser.username = inputvalues[1];
            newuser.FirstName = inputvalues[2];
            newuser.LastName = inputvalues[3];
            newuser.CommunityNickname = inputvalues[2].substring(0,4) + inputvalues[3].substring(0,4);
            newUser.alias = inputvalues[2].substring(0,4)+ inputvalues[3].substring(0,4);
            newuser.LocaleSidKey='en_US';
            newuser.TimezoneSidKey='America/Los_Angeles';
            newuser.EmailEncodingKey='UTF-8';
            newuser.LanguageLocaleKey='en_US';
          
            newuser.ProfileId = lstProfile.Id;
            System.debug('newuser----------------------->'+newuser);
            newuser.setOptions(dmo);
            
            newUserList.add(newuser); 
                    
            /*            
            Account a = new Account();
            a.Name = inputvalues[0];
            a.ShippingStreet = inputvalues[1];       
            a.ShippingCity = inputvalues[2];
            a.ShippingState = inputvalues[3];
            a.ShippingPostalCode = inputvalues[4];
            a.ShippingCountry = inputvalues[5];

            accstoupload.add(a);
            */
        }
        try{
            Database.SaveResult[] results = Database.insert(newUserList,false);
            System.debug('results------------------>'+results);
        }catch (Exception e){
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
                ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    
    public List<User> getuploadedUsers(){
        if (newUserList!= NULL)
            if (newUserList.size() > 0)
                return newUserList;
            else
                return null;                    
        else
            return null;
    }   
}