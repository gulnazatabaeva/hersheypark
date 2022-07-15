trigger Test2 on Account (Before Update) {

    for(Account acc: Trigger.old){
       system.debug('Old map Value: ' +Trigger.oldMap.get(acc.id).Rating);
    }
    

}