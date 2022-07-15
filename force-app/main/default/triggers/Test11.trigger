trigger Test11 on Account (after undelete){
    for(account acc:trigger.new){
        acc.name='exited ' + acc.name;
    }
}