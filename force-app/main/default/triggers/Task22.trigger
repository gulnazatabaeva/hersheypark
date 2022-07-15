trigger Task22 on Account (after insert) {
    for(Account acc1: Trigger.new){
            Task task1=new Task();
            task1.Subject='There is a problem';
            task1.Description='Attention';
            task1.Priority='High';
            task1.WhatId=acc1.Id;
            insert task1;
        }
    }