trigger Test10 on Contact (before update) {
for(Contact con1: Trigger.new){
	if(Trigger.OldMap.get(con1.Id).Email==Null){
          	con1.Email = 'Salesforce@gmail.com';
            }
    }
}