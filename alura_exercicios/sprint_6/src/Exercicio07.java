public class Exercicio07 {
    public static void main(String[] args) {

        String customer1 = "Fulano";
        String customer2 = "Sicrano";
        int birthYearCustomer1 = 1980;
        int birthYearCustomer2 = 2000;
        String header = """
                    >>> Listagem dos Clientes
                    >>> Ano atual: 2023
                    ___________________________________________________
                    """;

        System.out.println(header);
        outputPhrase(customer1, birthYearCustomer1);
        outputPhrase(customer2, birthYearCustomer2);
    }

    static String ageGroup(int birthYear) {
        String ageGroup = "";
        int age = ageCalculator(birthYear);
        if (age <= 17) {
            ageGroup = "ADOLESCENTE";
        } else if (age >= 18 && age <=29) {
            ageGroup = "JOVEM";
        } else if (age >= 30 && age <= 59) {
            ageGroup = "ADULTO";
        } else {
            ageGroup = "IDOSO";
        }
        return ageGroup;
    }

    static int ageCalculator (int birthYear) {
        int currentYear = 2023;
        return currentYear - birthYear;
    }

    static void outputPhrase (String customer1, int birthYearCustomer1) {
        System.out.println("Nome: " + customer1 + "\nDataNascimento: " + birthYearCustomer1 + "\nIdade: " + ageCalculator(birthYearCustomer1) + "\nCaracterisitca Etária: " + ageGroup(birthYearCustomer1) + "\n___________________________________________________");
    }
}