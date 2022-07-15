trigger Test1 on Account (after update) {
    List<Account> ListOldAccount=new List<Account>();
    for(Account acc: Trigger.old){
        if(acc.Name.startsWith('DR')){
            acc.Name='DR '+acc.Name;
        }
    }
}