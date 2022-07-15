public class Fitness {
	
    public decimal calculateBMI (decimal weight, decimal height){
        decimal bmi_calc1;
        if (weight<0 || height<0){
            bmi_calc1=0;
        }
        else {
            bmi_calc1=weight/height;
        }
        return bmi_calc1;
    }
    
}