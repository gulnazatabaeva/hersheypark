@IsTest
public class AccountTriggerTest2022 {
    
    @TestSetup
    static void setup() {
        Account testAccount = new Account(Name = 'test');
        testAccount.Name = 'GetForce';
        testAccount.BillingCity = 'Brno';
        testAccount.BillingState = 'South Moravia';
        testAccount.BillingCountry = 'Czech Republic';
        testAccount.BillingPostalCode = '602 00';
        testAccount.BillingStreet = 'Masarykova';
        insert testAccount;
        
        Contact testContact = new Contact(AccountId = testAccount.Id, LastName = 'test', Email='litarabics@gmail.com', Birthdate=date.newInstance(1990, 02, 01), MobilePhone='1234567890');
        insert testContact;
    }
    
    @IsTest
    static void copyBillingAddressTest() {
        //given
        Account testAccount = new Account();
        testAccount.Name = 'Avast';
        testAccount.BillingCity = 'Brno';
        testAccount.BillingState = 'South Moravia';
        testAccount.BillingCountry = 'Czech Republic';
        testAccount.BillingPostalCode = '602 00';
        testAccount.BillingStreet = 'Masarykova';
        
        //when
        Test.startTest();
        insert testAccount;
        Test.stopTest();
        
        //then
        Account result = [SELECT Id, ShippingCity, ShippingCountry, ShippingPostalCode, ShippingStreet FROM Account WHERE Id =: testAccount.Id];
        System.assertEquals(testAccount.BillingCity, result.ShippingCity);
        System.assertEquals(testAccount.BillingCountry, result.ShippingCountry);
        System.assertEquals(testAccount.BillingPostalCode, result.ShippingPostalCode);
        System.assertEquals(testAccount.BillingStreet, result.ShippingStreet);
    }
   
    
    @IsTest
    static void updateRelatedOwnerTest() {
        //given
        Account testAccount = [SELECT Id, OwnerId FROM Account LIMIT 1];
        User user = [SELECT Id FROM User WHERE Id != :UserInfo.getUserId() LIMIT 1];
        
        testAccount.OwnerId = user.Id;
        
        //when
        Test.startTest();
        update testAccount;
        Test.stopTest();
        
        //then
        Contact contact = [SELECT Id, OwnerId FROM Contact WHERE AccountId =: testAccount.Id];
        System.assertEquals(user.Id, contact.OwnerId);
    }    
    
    @IsTest
    static void populateMailingAddressTest() {
        //given
        Account testAccount = [SELECT Id, BillingCity, BillingCountry, BillingStreet FROM Account LIMIT 1];
        testAccount.BillingCity = 'Bishkek';
        testAccount.BillingState = 'Chui';
        testAccount.BillingCountry = 'Kyrgyz Republic';
        testAccount.BillingStreet = 'Chui street';
        
        //when
        Test.startTest();
        update testAccount;
        Test.stopTest();
        
        //then
        Contact contact = [SELECT Id, MailingCity, MailingCountry, MailingStreet, MailingState FROM Contact WHERE AccountId =: testAccount.Id];
        System.assertEquals(contact.MailingCity, testAccount.BillingCity);
        System.assertEquals(contact.MailingCountry, testAccount.BillingCountry);
        System.assertEquals(contact.MailingStreet, testAccount.BillingStreet);
        System.assertEquals(contact.MailingState, testAccount.BillingState);
    }
}