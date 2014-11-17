global class DemoClass{

    global class Demo{
        webservice string Name;
        webservice Integer Age;
    }
    
    webservice static Demo createDemoObject(Demo d){
    
        Demo_Object__c obj = new Demo_Object__c();
        obj.Name__c = d.Name;
        obj.Age__c = d.age;
        insert obj;
        
         return d;
    }

}