public with sharing class EmployeeCustomUpsertController {

        public Employee__c Emp {get; set;}
        
        public EmployeeCustomUpsertController()
        {
                Id id = ApexPages.currentPage().getParameters().get('id');
                Emp = (id == null)? new Employee__c() : [SELECT Id,Name, First_Name__c, Last_Name__c FROM Employee__c where Id = :id];
        }
        
        public PageReference Save()
        {
                try
                {
                        upsert(Emp);
                }
                catch(Exception ex)
                {
                        //ApexPages.addMessages(ex);
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage());
                        ApexPages.addMessage(myMsg);
                        return null;
                }
                
                return (new ApexPages.Standardcontroller(Emp)).view();
        }
}