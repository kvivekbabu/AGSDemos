public class WebSvcCallout {
    public static String callFahrenheitToCelsius(String input) {
        wwwW3schoolsComWebservices.TempConvertSoap sample = new wwwW3schoolsComWebservices.TempConvertSoap();
        sample.endpoint_x = 'http://api.salesforce.com/foo/bar';
        
        // This invokes the EchoString method in the generated class
        String echo = sample.FahrenheitToCelsius(input);
        
        return echo;
    }   
    
     public static String callCelsiusToFahrenheit(String input) {
        wwwW3schoolsComWebservices.TempConvertSoap sample = new wwwW3schoolsComWebservices.TempConvertSoap();
        sample.endpoint_x = 'http://api.salesforce.com/foo/bar';
        
        // This invokes the EchoString method in the generated class
        String echo = sample.CelsiusToFahrenheit(input);
        
        return echo;
    }  
}