trigger Test16 on Opportunity (before update) {
    for(Opportunity opp1: Trigger.new){
        if(opp1.StageName=='Closed Won'){
            opp1.CloseDate=date.today();
            opp1.Type='New Customer';
        }
    }
}