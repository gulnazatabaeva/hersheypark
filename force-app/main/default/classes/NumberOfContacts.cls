public with sharing class NumberOfContacts {

          public static void countContacts(Set<id> setId) 
          {
              List<Account> listAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
              for( Account acc : listAccount )
              {
                  List<Contact> listCont = acc.contacts ;
                  
                  acc.Number_of_Contacts__c = listCont.size();
              }
              update listAccount;
          }
        }