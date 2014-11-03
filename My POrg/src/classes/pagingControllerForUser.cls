public class pagingControllerForUser
{

    public PageReference nextPage() {
        con.setPageSize(selectedPage);
        return null;
    }

     //Instantiate the StandardSetController
    public ApexPages.StandardSetController con{get; set;}
    public Integer selectedPage {get;set;}
    
    public List<Opportunity> AllSearchUsers
    {
        get
        {
            if(con != null)
                return (List<Opportunity>)con.getRecords();
            else
                return null ;
        }
        set;}
    
    public Opportunity oppr{get; set;}
    
    //Controller
    public pagingControllerForUser()
    {
        AllSearchUsers = new List<Opportunity>() ;
        oppr = new Opportunity() ;
    }
    
     public PageReference Search()
    {   
        if(oppr.Name != null)
        {
            con = new ApexPages.StandardSetController(Database.getQueryLocator([select Id , name, Account.Name, StageName, Amount, CloseDate from Opportunity where name Like: '%'+oppr.Name+'%']));
 
            // sets the number of records in each page set
            con.setPageSize(5);
        }
        else
        {
            con = null;
        }
        return null ;
    }
    
   
    
    //Boolean to check if there are more records after the present displaying records
    public Boolean hasNext
    {
        get
        {
            return con.getHasNext();
        }
        set;
    }
 
    //Boolean to check if there are more records before the present displaying records
    public Boolean hasPrevious
    {
        get
        {
            return con.getHasPrevious();
        }
        set;
    }
 
    //Page number of the current displaying records
    public Integer pageNumber
    {
        get
        {
            return con.getPageNumber();
        }
        set;
    }

    //Returns the previous page of records
    public void previous()
    {
        con.previous();
    }
 
    //Returns the next page of records
    public void next()
    {
        con.next();
    }
}