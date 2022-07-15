public class DescriptionUpdate implements Database.Batchable<sObject> {
    Public Date startDate;
    Public Date endDate;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id, createdDate From Account where createdDate >: startDate and createdDate <: endDate');
    }
    public void execute(Database.BatchableContext bc, List<Account> accRecords){
        List<Account> accountsToUpdate = new List<Account>();
        List<Task> task22 = new List<Task>();
        for(Account acc2: accRecords){
            acc2.Description='I am coming from Batch Apex';
            accountsToUpdate.add(acc2);
            Task task1=new Task(Subject='There is an issue', Description='Urgent', Priority='High', WhatId=acc2.Id);
            task22.add(task1);
        }
        insert task22;
        update accountsToUpdate ;
        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}