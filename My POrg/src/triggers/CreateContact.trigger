trigger CreateContact on Account (After Insert) {
  
  List<Contact> lstContactToInsert=new List<Contact>();
  
  For(Account acc: Trigger.new){
      Contact Con = new Contact();
      Con.Lastname =acc.Name;
      Con.Accountid = acc.id;
      lstContactToInsert.add(con);
  }
  
  if(!lstContactToInsert.ISEMPTY()){
      insert lstContactToInsert;
  }

}