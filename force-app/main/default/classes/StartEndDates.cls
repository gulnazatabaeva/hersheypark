public class StartEndDates implements Database.Batchable<sObject>, Schedulable {
    public void execute(SchedulableContext ctx) {
        StartEndDates acc22 = new StartEndDates();
        acc22.startDate = date.newInstance(2022, 02, 04);
        acc22.endDate = date.newInstance(2022, 04, 06);
        Database.executebatch(acc22, 200);
    }
    	Public Date startDate;
    	Public Date endDate;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id, createdDate From Account where createdDate >: startDate and createdDate <: endDate');
        // collect the batches of records or objects to be passed to execute
    }
    public void execute(Database.BatchableContext bc, List<Account> accRecords){
        //delete accRecords ;
        // process each batch of records
    }
    public void finish(Database.BatchableContext bc){
        
        // execute any post-processing operations
    }
}