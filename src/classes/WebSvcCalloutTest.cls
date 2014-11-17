@isTest
private class WebSvcCalloutTest {
    @isTest static void testcallFahrenheitToCelsius() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        
        // Call the method that invokes a callout
        String output = WebSvcCallout.callFahrenheitToCelsius('50');
        
        // Verify that a fake result is returned
        System.assertEquals('99', output); 
    }
    
    @isTest static void testcallCelsiusToFahrenheit() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new WebServiceMockImpl2());
        
        // Call the method that invokes a callout
        String output = WebSvcCallout.callCelsiusToFahrenheit('99');
        
        // Verify that a fake result is returned
        System.assertEquals('50', output); 
    }
}