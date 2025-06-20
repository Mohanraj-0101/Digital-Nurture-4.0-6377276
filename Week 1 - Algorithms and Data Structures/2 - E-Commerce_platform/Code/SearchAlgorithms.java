
import java.util.Arrays;
import java.util.Comparator;

public class SearchAlgorithms {
    
    // Linear Search - O(n)
    public static Product linearSearch(Product[] products, String target){
        for(Product p : products){
            if(p.productName.equalsIgnoreCase(target)){
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String target){
        int left = 0;
        int right = products.length - 1;

        int mid = (left + right) / 2;
        int comparison = products[mid].productName.compareToIgnoreCase(target);

        if(comparison == 0) return products[mid];
        else if(comparison < 0) left = mid + 1;
        else right = mid - 1;

        return null;
    }

    public static void sortProducts(Product[] products){
        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));
    }
}
