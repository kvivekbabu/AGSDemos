public class ExampleController6_1 {
    public String name { get; set; }
    
    public String message { get; private set; }
    
    public PageReference hello() {
        message = 'Hello, ' + name;
        return null;
    }
}