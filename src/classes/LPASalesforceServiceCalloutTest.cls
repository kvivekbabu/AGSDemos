@isTest
private class LPASalesforceServiceCalloutTest{
    @isTest static void testcallPublishToLPA() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new LPASalesforceServiceMockImpl());
        

        LPASalesforceService.Master_Data_Request request = new LPASalesforceService.Master_Data_Request();
        
        LPASalesforceService.HEADER head= new LPASalesforceService.Header();

        LPASalesforceService.Body body= new LPASalesforceService.Body();        
        
        request.Header = head;
        request.Body = body; 
        
        // Call the method that invokes a callout
        LPASalesforceServiceCallout.callPublishToLPA(request);       
    }
}