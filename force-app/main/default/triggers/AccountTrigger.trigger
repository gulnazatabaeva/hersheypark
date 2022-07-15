trigger AccountTrigger on Account (after insert) {
    if(Trigger.isInsert && Trigger.isAfter) {
        MyFirstFutureMethod.someFutureMethod(Trigger.newMap.KeySet());
        System.debug('Test future');
        
        
    }
    if(Trigger.isInsert && Trigger.isBefore) {
        
        for(Account singleAccount : Trigger.new){
            if(singleAccount.BillingStreet != null){
                singleAccount.ShippingStreet =singleAccount.BillingStreet;
            }
            
            if(singleAccount.BillingCity != null){
                singleAccount.ShippingCity = singleAccount.BillingCity;
            }
            
            if(singleAccount.BillingState != null){
                singleAccount.ShippingState = singleAccount.BillingState;
            }
            
            if(singleAccount.BillingPostalCode != null){
                singleAccount.ShippingPostalCode = singleAccount.BillingPostalCode;
            }
            
            if(singleAccount.BillingCountry != null){
                singleAccount.ShippingCountry = singleAccount.BillingCountry;
            }
        }
        
    }
}