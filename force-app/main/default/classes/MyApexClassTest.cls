@isTest
public with sharing class MyApexClassTest {
    @isTest
    public MyApexClassTest() {
                Contact con1= [Select Id, Email From Contact Limit 1];
                
                Test.startTest();
                update con1;
                Test.stopTest();
                
                Contact con2 = [Select Id, Email From Contact Where con2.Id=:con1.Id];
                System.assertNotEquals(con1.Email, con2.Email);
                }
        }