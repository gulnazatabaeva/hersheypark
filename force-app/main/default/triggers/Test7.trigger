trigger Test7 on Account (before update) {
    //this trigger changes the phone number of contacts related to the account when account phone number is changed.
 /*   Map<id,Account> accmap = new map<id,account>();
    accmap=trigger.newmap;*/
    
    List <Contact> tempList = [Select AccountId, phone from contact where AccountId in:Trigger.newMap.keySet()];
    
    for (Contact c: tempList)
    {
    Account a=Trigger.newMap.get(c.AccountId);
    c.phone=a.Phone;
        
    }
    update tempList;

}