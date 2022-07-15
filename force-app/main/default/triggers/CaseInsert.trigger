trigger CaseInsert on Case (before insert) {
    for(Case cas: Trigger.new){
        if(cas.origin=='email'){
            cas.status='working';
            cas.priority='low';
    }
}
}