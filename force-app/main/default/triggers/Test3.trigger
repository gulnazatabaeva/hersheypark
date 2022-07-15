trigger Test3 on Account (Before Update) {

    for(Account newOpp : trigger.New){
        
        for(Account oldOpp: Trigger.old){
            if(oldOpp.Name.StartsWith('DR')){
               
            }
            else{
                newOpp.Name = 'DR   '+newOpp.Name;
            }
        }
    }   
}