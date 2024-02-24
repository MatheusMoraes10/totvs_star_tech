public class Exercicio05 {
    public static void main(String[] args) {

        String product1 = "Livro";
        String product2 = "Celular";
        double priceProduct1 = 49.95;
        double priceProduct2 = 1470.76;
        String header = """
                    >>> Listagem dos Produtos
                    ___________________________________________________
                    """;

        System.out.println(header);
        System.out.println("Nome: " + product1 + "\nPreço: " + priceProduct1 + "\n___________________________________________________");
        System.out.println("Nome: " + product2 + "\nPreço: " + priceProduct2);
    }
}