public class LPASalesforceServiceFutureCallout
{
    @future (callout=true)
    public static void callPublishToLPA(string inputValue)
    {
        Account obj;
        try
        {
            System.debug( 'Received Input: ' + inputValue ) ;
            
            obj=new Account();
            obj = [select 
                    Name,Customer_Number__c,Status__c,Institution_Type__c, Quality_Rating__c
                    ,Onbase_Code__c,Pending_Status_On__c
                    ,Contract_UW_Eligible__c, MI_Eligible__c,Contract_UW_Investor_Approved__c
                    from Account where id=: inputValue];
            
            //Create web service stub
            LPASalesforceService.basic stub= new LPASalesforceService.basic();
            
            LPASalesforceService.Master_Data_Request request = new LPASalesforceService.Master_Data_Request();
                        
            //Populate Header details                    
            LPASalesforceService.HEADER header= new LPASalesforceService.Header();
            header.DestinationAppName = 'LPA';
            header.SourceAppName = 'SALESFORCE';
            header.TransactionId = GUIDGenerator.NewGuid();                        
            header.RequestTimeStamp = Datetime.now();
                      
            //Prepare Datadrops
            LPASalesforceService.ArrayOfDataDrop arrDrops= new LPASalesforceService.ArrayOfDataDrop();            
            LPASalesforceService.DataDrop[] drops= new LPASalesforceService.DataDrop[10];
            LPASalesforceService.DataDrop drop =  new LPASalesforceService.DataDrop();
            
            drop.Name = 'S_Name';
            drop.Value = obj.Name;
            drops[0] = drop;
            
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Customer_Number';
           drop.Value = obj.Customer_Number__c;
           drops[1] = drop;     
                  
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Status';
           drop.Value = obj.Status__c;
           drops[2] = drop;     
            
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Institution_Type';
           drop.Value = obj.Institution_Type__c;
           drops[3] = drop;
            
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Quality_Rating';
           drop.Value = obj.Quality_Rating__c;
           drops[4] = drop;
            
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Onbase_Code';
           drop.Value = obj.Onbase_Code__c;
           drops[5] = drop;
                        
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Pending_Status_On';
           drop.Value = string.valueOf(obj.Pending_Status_On__c);
           drops[6] = drop;
                             
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Contract_UW_Eligible';
           drop.Value = string.valueOf(obj.Contract_UW_Eligible__c);
           drops[7] = drop;
             
          drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_MI_Eligible';
           drop.Value = string.valueOf(obj.MI_Eligible__c);
           drops[8] = drop;
                       
           drop  =  new LPASalesforceService.DataDrop();
           drop.Name = 'S_Contract_UW_Investor_Approved';
           drop.Value = string.valueOf(obj.Contract_UW_Investor_Approved__c);
           drops[9] = drop;
                        
            arrDrops.DataDrop = drops;
            
            //Prepare Entities
            LPASalesforceService.Entity entity = new LPASalesforceService.Entity();
            entity.DataDrops = arrDrops;
            
            LPASalesforceService.ArrayOfEntity arrEntities= new LPASalesforceService.ArrayOfEntity();
            
            LPASalesforceService.Entity[] entities= new LPASalesforceService.Entity[1];
                       
            entities[0] = entity;
            arrEntities.Entity = entities;
              
            //Populate Body details
            LPASalesforceService.Body body= new LPASalesforceService.Body();  
            body.EntityOperation = 'UPDATE';
            body.EntityType = 'CUSTOMER';
            
            body.Entities = arrEntities;                                   
        
            request.Header = header;
            request.Body = body;
                    
            system.debug('**********************************webservice call - start**********************************');
            
            //Call web service method and hold return value
            stub.PublishToLPA(request) ;              
            
            system.debug('**********************************webservice call - end**********************************');
        }
        catch(System.AsyncException e)
        { 
            system.debug('There was a problem updating the accounts');
        }
    }
}