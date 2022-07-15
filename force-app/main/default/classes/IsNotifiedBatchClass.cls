global class IsNotifiedBatchClass implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, IsNotified__c FROM Log__c Where IsNotified__c = false');
    }
    global void execute(Database.BatchableContext bc, List<Log__c> records){
        for(Log__c ms : records) {
		ms.IsNotified__c = true;
}
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'litarabics@gmail.com'});
        mail.setReplyTo('litarabics@gmail.com');
        mail.setSenderDisplayName('Batch Process');
        mail.setSubject('This is only one notification!');
        mail.setPlainTextBody('Batch Process has completed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    }