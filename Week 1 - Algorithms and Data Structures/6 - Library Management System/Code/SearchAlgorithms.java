
public class SearchAlgorithms {

    public static Book linearSearch(Book[] books, String target) {
        for (Book b : books) {
            if (b.title.equalsIgnoreCase(target)) {
                return b;
            }
        }
        return null;
    }

    public static Book binarySearch(Book[] books, String target) {
        int left = 0;
        int right = books.length - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            int comparison = books[mid].title.compareToIgnoreCase(target);

            if (comparison == 0) {
                return books[mid]; 
            }else if (comparison < 0) {
                left = mid + 1; 
            }else {
                right = mid - 1;
            }
        }
        return null;
    }
}
