trigger TaskOpportunity on Opportunity (after insert) {
    for(Opportunity opp1: Trigger.new){
        if(opp1.Amount>=50000){
            Task task1=new Task();
            task1.Subject='Call customer within one day';
            task1.Description='Big alert customer';
            task1.Priority='High';
            task1.WhatId=opp1.Id;
            insert task1;
        }
    }
}