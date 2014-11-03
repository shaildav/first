public class myOppsController
{

public ApexPages.StandardSetController con{get; set;}
public Opportunity oppr{get; set;} 

public List<Opportunity> opportunities
    {
        get
        {
            if(con == null){
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name, Amount, Account.Name, CloseDate from Opportunity]));
                // sets the number of records in each page set
                con.setPageSize(10);
                return (List<Opportunity>)con.getRecords();       
                }else
                return null ;
        }
        set;}
        
     
    
    // indicates whether there are more records after the current page set.
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
 
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
 
    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
    
public void first() {
        con.first();
    }
 
    // returns the last page of records
    public void last() {
        con.last();
    }
 
    // returns the previous page of records
    public void previous() {
        con.previous();
    }
 
    // returns the next page of records
    public void next() {
        con.next();
    }
 
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
        con.cancel();
    }
}