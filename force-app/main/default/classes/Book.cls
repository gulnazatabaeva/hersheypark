public class Book {

    public class PriceException extends Exception {}
    String author;
    String name;
    Integer price;
    
    public Book(String author, String name, Integer price) {
        this.author = author;
        this.name = name;
        if(price < 20) {
            throw new PriceException('Minimum price for this book is 20!');
        }
        this.price = price;
    }
}