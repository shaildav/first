public with sharing class AccountJSONCreator {

    public String getJSON()
    {
        String UserName = Apexpages.currentPage().getParameters().get('UserName');
        List<UserWrapper> wrp = new List<UserWrapper>();
        for (User a : [Select FirstName, LastName From User 
                            WHERE Name Like : '%'+UserName+'%' ]) {
               UserWrapper w = new UserWrapper (a.FirstName,nullToBlank (a.LastName));
               wrp.add(w);
            }
        return JSON.serialize(wrp);
    }

    public String nullToBlank(String val)
    {
        return val == null ?'':val;
    }

    public class UserWrapper
    {
        String LastName,FirstName;

        public UserWrapper(String uFName, String uLName)
        {
            LastName= uLName;
            FirstName = uFName;
        }
    }
}