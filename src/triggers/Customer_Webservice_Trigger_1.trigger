trigger Customer_Webservice_Trigger_1 on Account (after Insert, after Update) {

    Account t = trigger.new[0];

    LPASalesforceServiceFutureCallout.callPublishToLPA(t.id); 
}