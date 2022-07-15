public class IsGoldOpportunity implements Queueable {
    
    public void execute(QueueableContext context) {
        
  
        List<Opportunity> oppList = [Select Id, AccountId, Amount From Opportunity Where Amount > 20000];
		Set<Id> ids = new Set<Id>();
        for (Opportunity opp: oppList){
            ids.add(opp.AccountId);
        }
            
        List<Account> accList = [SELECT Id, IsGold__c FROM Account WHERE Id=:ids];
        for (Account acc: accList){ 
                acc.IsGold__c=true;
                accList.add(acc);
            }
        		update accList;
        }
}