trigger Temp_Conversion_Trigger on Temp_Conversion__c (after Insert, after Update) {

    System.debug( 'executing trigger' ) ;

    Temp_Conversion__c t = trigger.new[0];
    
    //if ((Trigger.Old[0].id <> t.id) || (Trigger.Old[0].id == null))
    if (t.Fahrenheit_Temperature__c == null)
    {
        TempConvertWebService.callTempConvertWebService(t.id); 
    }
}