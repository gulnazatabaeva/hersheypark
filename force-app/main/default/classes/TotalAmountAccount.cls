public class TotalAmountAccount {
	public Account totalAmount;
    public static void rollupOpportunities(List<Opportunity> opportunities) {
    Set<Id> accountIds = new Set<Id>();
	
    for (Opportunity opp : opportunities) {
        accountIds.add(opp.AccountId);
    }

    if (accountIds.isEmpty() == false) {
        }
        else {

        }
    }
}