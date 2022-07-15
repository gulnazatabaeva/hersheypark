trigger Test15 on Account (after insert) {
	    for(Account acc: Trigger.new){
                if(acc.Industry=='Banking'){
				Contact con=new Contact();
                con.LastName=acc.Name;
                con.Birthdate=date.newInstance(1996, 09, 01);
                con.MobilePhone='123456789';
                con.Phone=acc.Phone;
                con.AccountId=acc.Id;
                insert con;
                }
        }
}