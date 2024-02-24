public class Exercicio06 {
    public static void main(String[] args) {

        String customer1 = "Fulano";
        String customer2 = "Sicrano";
        int birthYearCustomer1 = 1980;
        int birthYearCustomer2 = 2000;
        String header = """
                    >>> Listagem dos Clientes
                    ___________________________________________________
                    """;

        System.out.println(header);
        System.out.println("Nome: " + customer1 + "\nDataNascimento: " + birthYearCustomer1 + "\n___________________________________________________");
        System.out.println("Nome: " + customer2 + "\nDataNascimento: " + birthYearCustomer2);
    }
}