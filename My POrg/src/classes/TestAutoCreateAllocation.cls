@isTest (seeAllData=true)
private class TestAutoCreateAllocation{

    static testMethod void runTestCases() {
        
       Opportunity opp1= [Select Id, Amount, StageName, CloseDate from Opportunity where Amount != null limit 1];
       Opportunity opp2= new Opportunity();
       opp2.Amount = Opp1.Amount;
       opp2.Stagename = opp1.Stagename;
       opp2.CloseDate = opp1.CloseDate;
       insert opp2;
    }
}