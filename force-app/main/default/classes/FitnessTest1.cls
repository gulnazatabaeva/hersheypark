@isTest
public class FitnessTest1 {
	@isTest
    public static void calculateBMItestPositive1() {
        Fitness myFitness = new Fitness();
        double inputValue = myFitness.calculateBMI(100, 50);
        system.assertEquals(2, inputValue);
    }
    @isTest
    public static void calculateBMItestNegative1() {
        Fitness myFitness2 = new Fitness();
        double inputValue = myFitness2.calculateBMI(-100, -50);
        system.assertEquals(0, inputValue);
    }
}