public class Logger {
    private static Logger instance;

    private Logger(){
        System.out.println("Message from Constructor");
    }

    public static Logger getInstance(){
        if(instance == null){
            instance = new Logger();
        }
        return instance;
    }

    public void log(String Message){
        System.out.println("Log : " + Message);
    }
}
