public with sharing class PickListController {

     Public String EmpPicklistValue{get;set;}     
     Public String DeptPicklistValue{get;set;}  
    
    public List<SelectOption> getEmpPicklist()
    {   
        List<SelectOption> options = new List<SelectOption>();
        List<Employee__c> employees = [ Select Id, Name, First_Name__c, Last_Name__c From  Employee__c ORDER BY Name ];
    
        options.add(new SelectOption('',''));
        
        for(Employee__c e : employees){
            String[] arguments = new String[] {e.First_Name__c , e.Last_Name__c};
            //string fullName = String.format(e.First_Name__c, e.Last_Name__c);
            string fullName = String.format('{0} {1}',arguments);
            options.add(new SelectOption(e.Name, fullName ));
        }
        return options;
    }
    
    public List<SelectOption> getDeptPicklist()
    {   
        List<SelectOption> options = new List<SelectOption>();
        List<Department__c> departments= [ Select Name,Department_Value__c From  Department__c Limit 100];
    
        options.add(new SelectOption('',''));
        
        for(Department__c d: departments){
            options.add(new SelectOption(d.Name, d.Department_Value__c ));
        }
    
        return options;
    }    
    
    public PageReference DummyDept() {
        return null;
    }
    
    public PageReference DummyEmp() {
        return null;
    }
    
    public PageReference Dummy() {
        return null;
    }

    
    Public Employee__c emp {get; private set;}    
    
    public PickListController()
    {
        emp = [SELECT Name, First_Name__c FROM Employee__c WHERE Name = 'AGS-000001' ];
    }
    
    
    /*public List<SelectOption> getPicklist() {
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult F = Contact.LeadSource.getDescribe();
             List<Schema.PicklistEntry> Ple = F.getPicklistValues();
             for(Schema.PicklistEntry p : ple){
                options.add(new SelectOption(p.getlabel(),p.getlabel()));
              }
        return options;
    }*/
}