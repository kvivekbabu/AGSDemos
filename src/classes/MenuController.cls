public class MenuController {

    public List<Menu_Item__c> getTopLevelItems() {
        return [Select Id, Name, Action__c,
                    (Select Id, Name, Action__c
                    From Sub_Menu_Items__r)
                From Menu_Item__c
                ORDER BY ORDER__c];
    }

}