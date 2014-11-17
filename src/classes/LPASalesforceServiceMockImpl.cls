@isTest
global class LPASalesforceServiceMockImpl implements WebServiceMock {
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
       LPASalesforceService.PublishToLPAResponse_element respElement = 
           new LPASalesforceService.PublishToLPAResponse_element();
       response.put('response_x', respElement); 
   }   
}