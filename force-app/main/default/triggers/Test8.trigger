trigger Test8 on Account (after update) {
      
     for(Account a: Trigger.new){
     Contact c = new Contact();
       
        {
            c = [Select phone from Contact where AccountId = :a.Id LIMIT 1];
             c.phone = a.Phone;
            update(c);
        }

}
}