public class SummaryReportCtrl{

    public List<Summary_Report__c> lstSummaryReport {get;set;}
    
    public SummaryReportCtrl(ApexPages.StandardController controller) {
        lstSummaryReport = Summary_Report__c.getAll().values();
    }
}