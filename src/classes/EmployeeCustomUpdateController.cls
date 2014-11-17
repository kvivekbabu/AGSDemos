public with sharing class EmployeeCustomUpdateController {

    private final Employee__C emp;

    public EmployeeCustomUpdateController() {
        emp = [SELECT Id, Name, First_Name__c, Last_Name__c FROM Employee__C 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Employee__C getEmp() {
        return emp;
    }

    public PageReference save() {
        update emp;
        return null;
    }
}