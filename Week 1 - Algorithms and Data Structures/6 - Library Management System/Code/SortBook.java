import java.util.Arrays;
import java.util.Comparator;

public class SortBook {
    // Sorting Technique Using Comparator for binary Search
    public static void sortBooks(Book[] books) {
        Arrays.sort(books, Comparator.comparing(b -> b.title.toLowerCase()));
    }
}
