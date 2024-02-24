import java.util.Scanner;

public class Exercicio08 {
    public static void main(String[] args) {
        Scanner read = new Scanner(System.in);
        int numberAsterisks = 0;

        System.out.println("Quanstos asteriscos voce deseja?");
        numberAsterisks = read.nextInt();

        //Printing Screen of user
        printingAsterisks(numberAsterisks);
        System.out.println("\nBem viundo ao Comex");
        printingAsterisks(numberAsterisks);
    }
    static void printingAsterisks(int numberAsterisks) {
        for (int i = 0; i < numberAsterisks; i++) {
            System.out.print("*");
        }
    }
}
