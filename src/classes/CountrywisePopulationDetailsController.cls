public class CountrywisePopulationDetailsController {

    Public String CountryValue{get;set;}
    public List<SelectOption> getCountryList()
    {   
        List<SelectOption> options = new List<SelectOption>();
        List<AggregateResult> countries = 
            [Select Country_Name__c, Country_Code__c From Population__c
            GROUP BY Country_Name__c, Country_Code__c 
            ORDER BY Country_Name__c 
            LIMIT 999];
    
        options.add(new SelectOption('',''));
        
        for(AggregateResult country : countries){
            options.add(new SelectOption(string.valueOf(country.get('Country_Code__c')), string.valueOf(country.get('Country_Name__c'))));
        }
        return options;
    }
       
    
    public List<ChartData> getData() {
        // Visualforce expressions can't pass parameters, so get from property
        return CountrywisePopulationDetailsController.generateData('ABC');
    }
    
    @RemoteAction
    public static List<ChartData> getRemoteData(String countryCode) {
        // Remoting calls can send parameters with the call
        return CountrywisePopulationDetailsController.generateData(countryCode);
    }

    // Private data "generator"
    public static List<ChartData> generateData(String countryCode) {
        List<ChartData> data = new List<ChartData>();
        
        List<Population__c> popResults= 
            [SELECT YEAR__C, Total_Population__c
                FROM POPULATION__C
                WHERE COUNTRY_CODE__C = :countryCode
                ORDER BY YEAR__C];
        
        for(Population__c pop: popResults)
        {
            data.add(new ChartData(pop.YEAR__C,pop.Total_Population__c));
        }
        
        return data;
    }

    // Wrapper class
    public class ChartData {

        public String Year{ get; set; }
        public Decimal Population { get; set; }

        public ChartData(String name, Decimal data) {
            this.Year = name;
            this.Population = data;
        }
    }
}