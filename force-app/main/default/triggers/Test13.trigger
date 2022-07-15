trigger Test13 on Contact (before insert, before update) {
    for(Contact cont: Trigger.new){
        if(cont.Email==null){
            cont.Email.addError('Please put email');
        }
    }
}