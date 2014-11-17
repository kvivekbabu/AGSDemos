public class LPASalesforceServiceCallout{
    public static void callPublishToLPA(LPASalesforceService.Master_Data_Request req) {
        LPASalesforceService.basic stub= new LPASalesforceService.basic();
        stub.endpoint_x = 'http://api.salesforce.com/foo/bar';
        
        // This invokes the PublishToLPA method in the generated class
        stub.PublishToLPA(req);
    }    
}