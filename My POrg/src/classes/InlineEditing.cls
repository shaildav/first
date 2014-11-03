public class InlineEditing
{
   public List<account> getListofAccounts()
   {
       List<account> accTempList = new List<account>([select id,Name,Industry from      Account order by LastModifiedDate ASC limit 5  ]);
       return accTempList;
   }
   public InlineEditing(ApexPages.standardController sc)
   {
       
   }
}