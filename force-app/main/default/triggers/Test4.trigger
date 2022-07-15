trigger Test4 on Account (before update) {
	for(Account acc: Trigger.new){
	Account oldAcc=Trigger.OldMap.get(acc.Id);
	if(!oldAcc.Name.StartsWith('Dr')){
          	acc.Name = 'Dr   '+acc.Name;
            }
    }
}