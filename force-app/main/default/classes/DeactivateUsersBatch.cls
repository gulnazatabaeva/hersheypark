public class DeactivateUsersBatch implements Database.Batchable<SObject>, Schedulable {
    
    public Boolean isActive = false;
    
    public void execute(System.SchedulableContext sc) {
        DeactivateUsersBatch batch = new DeactivateUsersBatch();
        batch.isActive = false;
        Database.executeBatch(batch, 200);
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        Id userId = UserInfo.getUserId();
        
        return Database.getQueryLocator('SELECT Id, IsActive FROM User WHERE Profile.Id = \'00e8c0000020goOAAQ\' AND Id != :userId');
    }
    
    public void execute(Database.BatchableContext bc, List<User> users) {
        List<User> usersToUpdate = new List<User>();
        
        for(User u : users) {
            u.IsActive = isActive;
            usersToUpdate.add(u);
        }
        
        update usersToUpdate;
    }
 
    public void finish(Database.BatchableContext bc) {}
}