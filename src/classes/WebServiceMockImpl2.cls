@isTest
global class WebServiceMockImpl2 implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
       wwwW3schoolsComWebservices.CelsiusToFahrenheitResponse_element respElement = 
           new wwwW3schoolsComWebservices.CelsiusToFahrenheitResponse_element();
       respElement.CelsiusToFahrenheitResult = '50';
       response.put('response_x', respElement); 
   }
   }