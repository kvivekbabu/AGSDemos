@isTest
global class WebServiceMockImpl implements WebServiceMock {
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
       wwwW3schoolsComWebservices.FahrenheitToCelsiusResponse_element respElement = 
           new wwwW3schoolsComWebservices.FahrenheitToCelsiusResponse_element();
       respElement.FahrenheitToCelsiusResult = '99';
       response.put('response_x', respElement); 
   }   
}