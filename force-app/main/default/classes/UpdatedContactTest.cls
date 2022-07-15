@isTest
public class UpdatedContactTest {
@isTest
    private static void TriggerTask(){
        Account acc1 = new Account();
        acc1.Name='Bogazici';
        acc1.BillingCity='Bishkek';
        insert acc1;
        
        Contact con1 = new Contact();
        con1.LastName='Bob';
        con1.Birthdate=date.newInstance(1990, 02, 02);
        con1.AccountId=acc1.Id;
        con1.MobilePhone='1234567890';
        con1.Email='litarabics@gmail.com';
        insert con1;
        
        
        Test.startTest();
        acc1.BillingCity='Osh';
        update acc1;
        Test.stopTest();
        
        Contact con2=[Select MailingCity from Contact where Id=:con1.Id];
        Account acc2=[Select BillingCity from Account where Id=:acc1.Id];
        
        
                   
        system.assertEquals(acc2.BillingCity, con2.MailingCity);
}
}