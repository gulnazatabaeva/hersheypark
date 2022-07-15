public class AccountService {
    
    public static void updateRelatedAddress(Map<Id, Account> oldMap, Map<Id, Account> newMap){
        Map<Id, Account> accountMap=new Map<Id, Account>();
        List<Contact> contactsToUpdate=new List<Contact>();
        
        for(Account acc1:newMap.values()){
            if(oldMap.get(acc1.Id).BillingCity!=acc1.BillingCity){
                accountMap.put(acc1.Id, acc1);
            }
        }
        for(Contact con1:[Select Id, AccountId, MailingAddress From Contact Where AccountId In:accountMap.keySet()]){
            con1.MailingCity=accountMap.get(con1.AccountId).BillingCity;
            contactsToUpdate.add(con1);
        }
        update contactsToUpdate;
    }
}