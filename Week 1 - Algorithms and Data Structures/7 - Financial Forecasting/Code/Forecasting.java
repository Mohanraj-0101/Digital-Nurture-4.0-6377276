public class Forecasting {
    public static double calculateFutureValue(double presentValue, double interestRate, int years){
        if(years == 0){
            return presentValue;
        }
        return calculateFutureValue(presentValue * (1 + interestRate), interestRate, years - 1);
    }

    public static double calculateFutureValueOptimized(double presentValue, double interestRate, int years){
        return presentValue * Math.pow(1 + interestRate, years);
    }
}
