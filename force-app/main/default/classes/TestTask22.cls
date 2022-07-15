@IsTest
public class TestTask22 {
@IsTest
    private static void testTask(){
        Account acc1=new Account();
        acc1.Name='Toyota';
        
        Test.startTest();
        insert acc1;
        Test.stopTest();
        
        Task ts1=[Select Id, Subject From Task Where whatId=:acc1.Id];
        System.assertNotEquals(null, ts1);
    }
}