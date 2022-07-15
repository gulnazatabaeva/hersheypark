trigger MyApexClass on Contact (before update) {
        for (Contact cont: Trigger.new){
        Contact cont2 = Trigger.OldMap.get(cont.Id);
        String oldEmail = cont2.Email;
        if(cont.Email!=oldEmail){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = new String[]{cont.Email};
            message.plainTextBody = 'Your new email is '+cont.Email;
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
            Messaging.sendEmail(messages);
    }
    }
    }