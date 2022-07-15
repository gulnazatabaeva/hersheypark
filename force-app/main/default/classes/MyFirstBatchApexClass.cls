public class MyFirstBatchApexClass implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id, IsSpam__c, CaseNumber From Case Where IsSpam__c=true');
        // collect the batches of records or objects to be passed to execute
    }
    public void execute(Database.BatchableContext bc, List<Case> caseRecords){
        delete caseRecords;
        // process each batch of records
    }
    public void finish(Database.BatchableContext bc){
        
        // execute any post-processing operations
    }
}