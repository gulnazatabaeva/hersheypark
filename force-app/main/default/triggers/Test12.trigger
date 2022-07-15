trigger Test12 on Opportunity (after insert, after update) {
    for(Opportunity opp1: Trigger.new){
        if(opp1.StageName=='Closed Won'){
            Task task1=new Task();
            task1.Subject='Call customer within one day';
            task1.Description='Big alert customer';
            task1.Priority='High';
            task1.WhatId=opp1.Id;
            insert task1;
        }
    }
}