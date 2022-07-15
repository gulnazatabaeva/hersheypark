public class MyFirstFutureMethod {
@future
  public static void someFutureMethod(Set<Id> recordIds) {
    List<Account> listAccount = [Select Id, Name from Account Where Id IN :recordIds];
    List<Contact> con22 = new List<Contact>();
    List<Opportunity> opp22 = new List<Opportunity>();
    List<Task> task22 = new List<Task>();
      for(Account acc23: listAccount){
          Contact con23 = new Contact(LastName='Khan Academy', Birthdate = date.newInstance(1990, 01, 01), MobilePhone = '1234567890', Email='litarabics@gmail.com', AccountId = acc23.Id);
          con22.add(con23);
          Opportunity opp23 = new Opportunity(Name='Sky Academy', StageName='Prospecting', CloseDate = date.newInstance(2022, 09, 09), AccountId=acc23.Id);
          opp22.add(opp23);
          Task task23 = new Task(Subject='There is an issue', Description='Urgent', Priority='High', WhatId=acc23.Id);
          task22.add(task23);
      }
      insert con22;
      insert opp22;
      insert task22;
      System.debug('Future test');     
  }
}