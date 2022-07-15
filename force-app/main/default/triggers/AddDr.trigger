trigger AddDr on Account (before insert, before update) {
    for(Account acc: Trigger.new){
        acc.name='Dr '+acc.name;
    }
}