public class Main{
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shoes", "Fashion"),
            new Product(103, "Phone", "Electronics"),
            new Product(104, "Bag", "Accessories"),
            new Product(105, "Watch", "Accessories")
        };

        //Linear Search - No Sorting Required

        Product foundlinear = SearchAlgorithms.linearSearch(products, "Phone");
        if(foundlinear != null){
            System.out.println("Linear Search Found : " + foundlinear.productName);
        }else{
            System.out.println("Linear Search : Product not found");
        }

        //Binary Search - Sorting Required
        SearchAlgorithms.sortProducts(products);
        Product foundbinary = SearchAlgorithms.binarySearch(products, "Phone");
        if(foundbinary != null){
            System.out.println("Binary Found : " + foundbinary.productName);
        }else{
            System.out.println("Binary Search : Product not found");
        }
    }
}