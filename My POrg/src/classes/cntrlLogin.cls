public with sharing class cntrlLogin {

    public String uPass { get; set; }
    public String uName { get; set; }
    public Boolean showError {get;set;}
    
    
    public PageReference save() {
        ValidateNull();
        return null;
    }

    public void ValidateNull(){
        System.debug('uName------------------->'+uName);
        if(uName !=null){
            System.debug('--------------------');
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please enter User Name and Password'));
        }
    }

    
}