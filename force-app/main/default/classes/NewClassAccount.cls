public class NewClassAccount {
	public static void updateAccount(Id accountId) {
  	Account acc = [SELECT Id, Name FROM Account WHERE Id =: accountId];
        System.debug(acc.Name);
    }
}