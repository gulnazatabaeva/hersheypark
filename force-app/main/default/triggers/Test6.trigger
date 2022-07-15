trigger Test6 on Case (before update) {
	for(Case cas: Trigger.new){
        if(Trigger.OldMap.get(cas.Id).Priority=='Low'){
            cas.Priority='High';
            cas.Status='Working';
            
        }
    }
}