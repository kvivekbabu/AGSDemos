public class PopulationDensityChartsController {
    Public String CountryValue{get;set;}
    public List<SelectOption> getCountryList()
    {   
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('high', 'Top 5 highly populated countries'));
        options.add(new SelectOption('low', 'Top 5 leasat populated countries'));
        
        return options;
    }
       
    
    public List<ChartData> getData() {
        // Visualforce expressions can't pass parameters, so get from property
        return PopulationDensityChartsController.generateData('ABC');
    }
    
    @RemoteAction
    public static List<ChartData> getRemoteData(String countryCode) {
        // Remoting calls can send parameters with the call
        return PopulationDensityChartsController.generateData(countryCode);
    }

    // Private data "generator"
    public static List<ChartData> generateData(String countryCode) {
        List<ChartData> data = new List<ChartData>();
        
        List<Population__c> popResults= 
            [SELECT YEAR__C, Total_Population__c
                FROM POPULATION__C
                WHERE YEAR__C = '2012' OR YEAR__C = '2011'
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