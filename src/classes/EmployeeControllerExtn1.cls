public with sharing class EmployeeControllerExtn1 {
    private final Employee__c emp;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public EmployeeControllerExtn1(ApexPages.StandardController stdController) {
        stdController.addFields(new String[]{
            'Name',
            'First_Name__c',
            'Id'
        });
        this.emp = (Employee__c)stdController.getRecord();
    }

    public String getGreeting() {
        return 'Hello ' + emp.First_Name__c + ' (' + emp.id + ')';
    }
}