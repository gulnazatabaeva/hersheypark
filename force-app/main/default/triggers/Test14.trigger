trigger Test14 on Account (after insert) {
	    for(Account acc: Trigger.new){
                if(acc.AnnualRevenue>=50000){
				Contact con=new Contact();
                con.FirstName='Smriti';
                con.LastName='Sharan';
                con.Birthdate=date.newInstance(1996, 09, 01);
                con.MobilePhone='123456789';
                con.AccountId=acc.Id;
                insert con;
                }
        }
}