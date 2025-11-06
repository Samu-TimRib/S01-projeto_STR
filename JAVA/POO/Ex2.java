import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }

    public String getNome() {
        return nome;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        // adiciona o bônus ao preço final (polimorfismo)
        return super.calcularPrecoFinal() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu() {
        this.itens = new ArrayList<>();
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }

    public void listarMenu() {
        System.out.println("Menu da Cafeteria:");
        for (Cafe c : itens) {
            System.out.println("- " + c.getNome() + " | Preço Final: R$ " + c.calcularPrecoFinal());
        }
    }
}

class CafeLeblanc {
    private Menu _menu;

    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome() + 
                           " | Total: R$ " + cafe.calcularPrecoFinal());
    }

    public void exibirMenu() {
        _menu.listarMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        Menu menu = new Menu();

        Cafe expresso = new Cafe("Expresso", 6.00);
        CafeGourmet cappuccino = new CafeGourmet("Cappuccino Gourmet", 10.00, 3.50);

        menu.adicionarItem(expresso);
        menu.adicionarItem(cappuccino);

        CafeLeblanc leblanc = new CafeLeblanc(menu);

        leblanc.exibirMenu();
        leblanc.receberPedido(cappuccino);
    }
}
