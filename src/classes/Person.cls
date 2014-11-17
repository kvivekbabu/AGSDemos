public class Person
{

    public Person() {
        FirstName='abc';
    }


    public Person(ApexPages.StandardController controller) {
        FirstName = '123';
    }
    
    public String FirstName {get;set;}
    public String LastName {get;set;}
    public Integer Age {get;set;}
    public String Address {get;set;}
    public Integer Salary {get;set;}
}