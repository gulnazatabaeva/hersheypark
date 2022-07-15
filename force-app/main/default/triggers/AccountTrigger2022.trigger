trigger AccountTrigger2022 on Account (before update) {
    
    if(Trigger.isUpdate && Trigger.isBefore) {
        accountService.updateRelatedAddress(Trigger.oldMap, Trigger.newMap);
        
    }
}