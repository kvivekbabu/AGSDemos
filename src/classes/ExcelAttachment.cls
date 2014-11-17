public class ExcelAttachment{

  List<Account> AccData;
  public String subject { get; set; }
  public String body { get; set; }
  
  
  public List<Account> getAccData(){
    
     AccData = [select id, name from Account];
     
     return AccData;  
  }
  
  public pageReference sendexcelfile(){
  
     subject = 'myExcel';
     body  = 'please find the attachment';
     string[] address = new string[]{'pambati@allianceglobalservices.com'};         
      Messaging.singleEmailMessage Emailwithattch = new Messaging.singleEmailMessage();
      pageReference excel = page.Schedule_UI; 
      
      Blob b = excel.getcontent();
     
     Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
     attach.setFileName('accountlist.xls');
     attach.setBody(b);
     
     Emailwithattch.setSubject(subject);
     Emailwithattch.setToaddresses(address);
     Emailwithattch.setPlainTextBody(body);
     
     Emailwithattch.setFileAttachments(new Messaging.EmailFileAttachment[]{attach});
        // Sends the email
        Messaging.SendEmailResult [] r = 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {Emailwithattch}); 

     
     return null;
  
  } 
  
  
 }