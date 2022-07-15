trigger myAccountTrigger on Account (before delete, before insert, before update, 
           after delete, after insert, after update) {
               if(Trigger.isBefore){
               		if(Trigger.isUpdate){
                        for(Account acc: Trigger.new) {
                            acc.Phone='0555555555';
                        }              }
  }
           }