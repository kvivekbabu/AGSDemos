trigger Customer_Webservice_Upsert_Trigger on Account (after Insert, after Update) {

    Account t = trigger.new[0];

    LPASalesforceServiceFutureCallout.callPublishToLPA(t.id); 
}