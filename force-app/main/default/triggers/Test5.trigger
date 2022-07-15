trigger Test5 on Account (before update) {
	for(Account acc: Trigger.new){
	if(Trigger.OldMap.get(acc.Id).Phone==Null){
          	acc.Phone = '+1 234 55 254';
            }
    }
}