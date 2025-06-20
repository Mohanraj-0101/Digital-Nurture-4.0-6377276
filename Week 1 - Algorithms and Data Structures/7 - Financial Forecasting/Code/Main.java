public class Main {
    public static void main(String[] args) {
        double presentValue = 1000.0;
        double interestRate = 0.05;
        int years = 5;

        double futureValueRecursive = Forecasting.calculateFutureValue(presentValue, interestRate, years);
        System.out.println("Future Value (Recursive): $" + futureValueRecursive);

        double futureValueOptimized = Forecasting.calculateFutureValueOptimized(presentValue, interestRate, years);
        System.out.println("Future Value (Optimized): $" + futureValueOptimized);
    }
}
