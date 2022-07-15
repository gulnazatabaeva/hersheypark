public class LastAccounts {
    	public List<Account> printList(){
    	List<Account> accountList= [Select Name, CreatedDate From Account Limit 10];
        Return accountList;                           
    }
}