@IsTest
public class MyTestClass1 {
@IsTest
    private static void testTask(){
        Seller s1=new Seller();
        s1.buyApples(10);

        Test.startTest();
        s1.sellApples(50);
        Test.stopTest();
        
        System.assertEquals(10, s1.getQuantityOfApples());
        System.assertEquals(1, s1.errors.size());
    }
}