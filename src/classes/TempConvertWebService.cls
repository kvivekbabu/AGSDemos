public class TempConvertWebService
{
    @future (callout=true)
    public static void callTempConvertWebService(string inputValue)
    {
        try
        {
            System.debug( 'Received Input' + inputValue ) ;
            
            Temp_Conversion__c obj=new Temp_Conversion__c();
            obj = [select Celcius_Temp__c,Fahrenheit_Temperature__c from Temp_Conversion__c where id=: inputValue];
            
            //Create web service stub
            wwwW3schoolsComWebservices.TempConvertSoap stub= new wwwW3schoolsComWebservices.TempConvertSoap();
            
            //Call web service method and hold return value
            string outValue= stub.CelsiusToFahrenheit(String.valueOf(obj.Celcius_Temp__c));
            
            //Update return value and persist to database
            obj.Fahrenheit_Temperature__c = Decimal.valueOf(outValue);
            update obj;    
        }
        catch(System.AsyncException e)
        { 
            System.debug( '****Exception' +e ) ;
        }
    }
}