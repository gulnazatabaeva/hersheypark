trigger Test21 on Opportunity (before insert) {
    for(Opportunity opp:  trigger.new){
        if(opp.Amount >100000000){
            opp.Amount.addError('The amount cannot be more than 100000000');
        }
            
    }
}