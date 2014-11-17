public class RestfulController {

    Public String ContryListValue{get;set;}
     Public String StatesListValue{get;set;}
     Public String displayLabel{get;set;}
     Public String ServiceURL = 'http://203.170.48.77:8090/ListsSrvc/';

    public List<SelectOption> getCountryList()
    {   
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('',''));
        
        String CountriesJSON = getCountriesFromJSONService();
        
        List<Country> countriesDeserialized = (List<Country>) JSON.deserialize(CountriesJSON, List<Country>.class);

        for(Country cnt: countriesDeserialized )
        {
            options.add(new SelectOption(cnt.Code, cnt.Name ));
        }       
        return options;
    }
    
    public List<SelectOption> getStatesList()
    {   
        List<SelectOption> options = new List<SelectOption>();
//        displayLabel  = JSON.serializePretty(states);
    
        options.add(new SelectOption('',''));
        
        String StatesJSON = getStatesFromJSONService();
        
        List<State> statesDeserialized = (List<State>) JSON.deserialize(StatesJSON, List<State>.class);
        
        State al = new State();
        al.Code = 'AL';
        al.Name = 'Alabama';
        al.ContryCode = 'USA';
        statesDeserialized.Add(al);
        
        State ak = new State();
        ak.Code = 'AK';
        ak.Name = 'Alaska';
        ak.ContryCode = 'USA';
        statesDeserialized.Add(ak);
        
        State az = new State();
        az.Code = 'AZ';
        az.Name = 'Arizona';
        az.ContryCode = 'USA';
        statesDeserialized.Add(az);
        
        State ar = new State();
        ar.Code = 'AR';
        ar.Name = 'Arkansas';
        ar.ContryCode = 'USA';
        statesDeserialized.Add(ar);
        
        State pa = new State();
        pa.Code = 'PA';
        pa.Name = 'Pennsylvania';
        pa.ContryCode = 'USA';
        statesDeserialized.Add(pa);
        
        State ca = new State();
        ca.Code = 'CA';
        ca.Name = 'California';
        ca.ContryCode = 'USA';
        statesDeserialized.Add(ca);
        
//        List<State> statesFiltered = [ Select Code, Name From  statesDeserialized WHERE CountryCode = 'USA' ORDER BY Name ];
//        List<State> statesFiltered = statesDeserialized.select('WHERE CountryCode = IND');

        for(State st: statesDeserialized)
        {
            if(st.ContryCode == ContryListValue)
            {
                options.add(new SelectOption(st.Code, st.Name ));
            }
        }       
        return options;
    }

    public String getCountriesFromJSONService()
    {
        String url = ServiceURL + 'Countries=Countries';   
        String ResponseAsJSON = '';
        // Instantiate a new http object
        Http httpObj = new Http();
    
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(url);
        httpReq.setMethod('GET');
    
        // Send the request, and return a response
        HttpResponse httpRes = httpObj.send(httpReq);
        ResponseAsJSON = httpRes.getBody();
        displayLabel = ResponseAsJSON;
//        ResponseAsJSON = '[{"Code":"IND","Name":"INDIA"},{"Code":"USA","Name":"United States of America"}]';
        return ResponseAsJSON;
    }    

    public String getStatesFromJSONService()
    {
        String url = ServiceURL + 'States=States';   
        String ResponseAsJSON = '';
        // Instantiate a new http object
        Http httpObj = new Http();
    
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(url);
        httpReq.setMethod('GET');
    
        // Send the request, and return a response
        HttpResponse httpRes = httpObj.send(httpReq);
        ResponseAsJSON = httpRes.getBody();
//        ResponseAsJSON = '[{"Code":"AP","ContryCode":"IND","Name":"Andhra Pradesh"},{"Code":"AR","ContryCode":"IND","Name":"Arunachal Pradesh"},{"Code":"AS","ContryCode":"IND","Name":"Assam"},{"Code":"BR","ContryCode":"IND","Name":"Bihar"},{"Code":"CT","ContryCode":"IND","Name":"Chhattisgarh"},{"Code":"GA","ContryCode":"IND","Name":"Goa"},{"Code":"GJ","ContryCode":"IND","Name":"Gujarat"},{"Code":"HR","ContryCode":"IND","Name":"Haryana"},{"Code":"HP","ContryCode":"IND","Name":"Himachal Pradesh"},{"Code":"JK","ContryCode":"IND","Name":"Jammu and Kashmir"},{"Code":"JH","ContryCode":"IND","Name":"Jharkhand"},{"Code":"KA","ContryCode":"IND","Name":"Karnataka"},{"Code":"KL","ContryCode":"IND","Name":"Kerala"},{"Code":"MP","ContryCode":"IND","Name":"Madhya Pradesh"},{"Code":"MH","ContryCode":"IND","Name":"Maharashtra"},{"Code":"MN","ContryCode":"IND","Name":"Manipur"},{"Code":"ML","ContryCode":"IND","Name":"Meghalaya"},{"Code":"MZ","ContryCode":"IND","Name":"Mizoram"},{"Code":"NL","ContryCode":"IND","Name":"Nagaland"},{"Code":"OR","ContryCode":"IND","Name":"Odisha"},{"Code":"PB","ContryCode":"IND","Name":"Punjab"},{"Code":"RJ","ContryCode":"IND","Name":"Rajasthan"},{"Code":"SK","ContryCode":"IND","Name":"Sikkim"},{"Code":"TN","ContryCode":"IND","Name":"Tamil Nadu"},{"Code":"TR","ContryCode":"IND","Name":"Tripura"},{"Code":"UP","ContryCode":"IND","Name":"Uttar Pradesh"},{"Code":"UT","ContryCode":"IND","Name":"Uttarakhand"},{"Code":"WB","ContryCode":"IND","Name":"West Bengal"}]';
        return ResponseAsJSON ;
    }
    
    public PageReference GetStatesByCountryFromJSON() 
    {
        displayLabel = 'Some text from GetStatesFromJSON function';
        return null;
    }
}