@isTest
public class ModelClassTest {
@isTest
    private static void TriggerTask(){
        Account acc1 = new Account();
        acc1.Name='Bogazici';
        insert acc1;
        
        Contact con1 = new Contact();
        con1.LastName='Bob';
        con1.Birthdate=date.newInstance(1990, 02, 02);
        con1.AccountId=acc1.Id;
        con1.MobilePhone='1234567890';
        con1.Email='litarabics@gmail.com';
        insert con1;
        
        acc1.OwnerId=[Select ID from User where Id !=:UserInfo.getUserId() Limit 1].Id;
        
        Test.startTest();
        update acc1;
        Test.stopTest();
        
        Contact con2=[Select OwnerId from Contact where Id=:con1.Id];
        Account acc2=[Select OwnerId from Account where Id=:acc1.Id];
        
        
                   
        system.assertEquals(acc2.OwnerId, con2.OwnerID);
}
}