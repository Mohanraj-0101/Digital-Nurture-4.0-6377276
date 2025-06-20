
public class Main {

    public static void main(String[] args) {
        Book[] books = {
            new Book(101, "Animal Farm", "George"),
            new Book(102, "Pearl", "John"),
            new Book(103, "Night", "Elie Wiesel")
        };

        Book linear = SearchAlgorithms.linearSearch(books, "Pearl");
        if (linear != null) {
            System.out.println("Linear Search Found : " + linear.title);
            System.out.println("Book ID : " + linear.bookId);
            System.out.println("Author : " + linear.author);
        } else {
            System.out.println("Linear Search Says : No book availabe in that title");
        }

        SortBook.sortBooks(books);
        Book binarysh = SearchAlgorithms.binarySearch(books, "Pearl");

        if (binarysh != null) {
            System.out.println("Binary Search Found : " + binarysh.title);
            System.out.println("Book ID : " + binarysh.bookId);
            System.out.println("Author : " + binarysh.author);
        } else {
            System.out.println("Binary Search Says : No book availabe in that title");
        }
    }
}
