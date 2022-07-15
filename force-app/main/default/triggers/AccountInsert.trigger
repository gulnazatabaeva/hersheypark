trigger AccountInsert on Contact (before insert) {
    for(Contact con: Trigger.new){
        con.Phone='100000000';
    }
}