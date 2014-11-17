public with sharing class EmployeeAddExtnController{
    private Employee__c emp;
    
    public string DeptCode {get; set;}
    
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard controller.
    public EmployeeAddExtnController(ApexPages.StandardController stdController) {
        emp = new Employee__c();     
    }
    
    public Employee__C getEmp() {
        return emp;
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
    
    public PageReference Save()
    {      
    
        
        delete [Select Id from Population__c where Name Like 'Pop-3%' Limit 9000];            
        
        Savepoint sp = Database.setSavepoint(); 
        
        try
        {
            insert emp;              
        }
        catch(Exception ex)
        {
            Database.rollback(sp); 
            emp= emp.clone(false);  
                
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.ERROR,
            'An error occured while inserting Employee record.' + ex.getMessage());
            ApexPages.addMessage(errMsg);
            
            return null;
        }  
              
        return null;
    }
    
    public PageReference WebServiceCall()
    {
        try
        {
            system.debug('**********web service call start**********');            
             //Create web service stub
            wwwW3schoolsComWebservices.TempConvertSoap stub= new wwwW3schoolsComWebservices.TempConvertSoap();            
            //stub.endpoint_x = 'http://dummyendpoint.asmx';            
            //Call web service method and hold return value
            string outValue= stub.CelsiusToFahrenheit('10');            
            system.debug('**********Return Value from web service: ' + outValue + '**********');    
        }
        catch(Exception ex)
        {
            emp= emp.clone(false);
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'An error occurred while sending Employee record. ' 
            + '\n' + 'Error Message: ' + ex.getMessage());
            ApexPages.addMessage(errMsg);
            
            return null;
        }
            
        return (new ApexPages.Standardcontroller(emp)).view();
    }

}