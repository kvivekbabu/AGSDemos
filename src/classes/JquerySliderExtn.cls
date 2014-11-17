public class JquerySliderExtn{
 
    Slider_Result__c d;        
 
    public JquerySliderExtn(ApexPages.StandardController controller){        
        d = (Slider_Result__c)controller.getRecord();             
    }        
 
    public void save(){        
        update d;        
    }
}