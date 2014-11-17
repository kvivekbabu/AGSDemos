trigger Customer_Webservice_Trigger on Customer__c (after Insert, after Update) {

    Customer__c t = trigger.new[0];

    LPASalesforceServiceFutureCallout.callPublishToLPA(t.id); 
}