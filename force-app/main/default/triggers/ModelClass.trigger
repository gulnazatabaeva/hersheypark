trigger ModelClass on Account (before insert, before update) {
if(Trigger.isUpdate && Trigger.isBefore) {
        Map<Id, Account> accountMap = new Map<Id, Account>();   
        List<Contact> contactsToUpdate = new List<Contact>();
        
        //filtering accounts where owner was updated
        for (Account account : Trigger.new) {
            
            if (Trigger.oldMap.get(account.Id).OwnerId != account.OwnerId) {
                accountMap.put(account.Id, account);
            }
            
        }
        
        for (Contact contact : [SELECT Id, OwnerId, AccountId FROM Contact WHERE AccountId IN :accountMap.keySet()]) {
            contact.OwnerId = accountMap.get(contact.AccountId).OwnerId;
            contactsToUpdate.add(contact);
        }
        
        update contactsToUpdate;
    }

}