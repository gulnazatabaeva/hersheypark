public class Seller {
public String name;
    private Integer quantityOfApples = 0;
    public List<String> errors = new List<String>();
    
    public void buyApples(Integer quantity) {
        if(quantity > 0) {
            quantityOfApples = quantityOfApples + quantity;
        } else {
            errors.add('I can not buy 0 or negative number of apples.');
        }
    }
    
    public void sellApples(Integer quantity) {
        if(quantity > 0 && quantity <= quantityOfApples) {
            quantityOfApples -= quantity;
        } else {
            errors.add('I can not sell 0 apples ...');
        }
    }
    
    public Integer getQuantityOfApples() {
        return quantityOfApples;
    }
}