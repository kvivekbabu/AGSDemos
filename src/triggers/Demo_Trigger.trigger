trigger Demo_Trigger on Demo_Object__c (after Insert) {

    Demo_Object__c d=trigger.new[0];
    TempConvertWebService.callTempConvertWebService(d.id); 

}