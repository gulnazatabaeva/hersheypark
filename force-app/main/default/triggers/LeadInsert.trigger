trigger LeadInsert on Lead (before insert, before update) {
    for(Lead leadName: Trigger.new){
        leadName.ProductInterest__c='XYZ- '+leadName.ProductInterest__c;
    }
}