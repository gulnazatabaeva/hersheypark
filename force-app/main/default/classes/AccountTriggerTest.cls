@isTest
public class AccountTriggerTest {
@isTest
    private static void TriggerTask(){
        Account acc1=new Account();
        acc1.Name='Mercedes';
        acc1.BillingStreet='Molodaya Gvardiya';
        acc1.BillingCity='Bishkek';
        acc1.BillingState='Chui';
        acc1.BillingCountry='Kyrgyzstan';
        acc1.BillingPostalCode='720048';
        
        Test.startTest();
        insert acc1;
        Test.stopTest();
        
        Account acc2 = [Select Id, Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, 
                        ShippingCountry From Account Where Id=:acc1.Id];
       	System.assertEquals(acc1.BillingStreet, acc2.ShippingStreet);
        System.assertEquals(acc1.BillingCity, acc2.ShippingCity);
        System.assertEquals(acc1.BillingState, acc2.ShippingState);
        System.assertEquals(acc1.BillingCountry, acc2.ShippingCountry);
        System.assertEquals(acc1.BillingPostalCode, acc2.ShippingPostalCode);
    }
}