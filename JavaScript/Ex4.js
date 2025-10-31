import java.util.*;

// Interface que define o comportamento rastreável
interface IRastreavel {
    String rastrearLocal(double latitude, double longitude);
}

// Classe base abstrata
abstract class Hunter implements IRastreavel {
    protected String nome;
    protected int idade;
    protected String localizacao;

    public Hunter(String nome, String localizacao, int idade) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    // Hash e equals garantem que Hunters duplicados (mesmo nome) não sejam adicionados ao Set
    @Override
    public int hashCode() {
        return Objects.hash(nome);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Hunter other = (Hunter) obj;
        return Objects.equals(nome, other.nome);
    }
}

// Subclasse Especialista
class Especialista extends Hunter {
    protected String habilidadeNen;

    public Especialista(String nome, String habilidade, String local, int idade) {
        super(nome, local, idade);
        this.habilidadeNen = habilidade;
    }

    @Override
    public String rastrearLocal(double latitude, double longitude) {
        this.localizacao = "Lat: " + latitude + ", Long: " + longitude;
        return "Especialista " + nome + " usando " + habilidadeNen + " rastreou local: " + localizacao;
    }
}

// Subclasse Manipulador
class Manipulador extends Hunter {
    protected Hunter alvoAtual;

    public Manipulador(String nome, Hunter alvo, String local, int idade) {
        super(nome, local, idade);
        this.alvoAtual = alvo;
    }

    @Override
    public String rastrearLocal(double latitude, double longitude) {
        this.localizacao = "Lat: " + latitude + ", Long: " + longitude;
        return "Manipulador " + nome + " rastreou " + (alvoAtual != null ? alvoAtual.getNome() : "ninguém") +
               " em " + localizacao;
    }
}

// Classe Batalhao
class Batalhao {
    private Set<Hunter> hunters;

    public Batalhao() {
        hunters = new HashSet<>();
    }

    public void adicionarHunter(Hunter h) {
        hunters.add(h);
    }

    public int getNumHunters() {
        return hunters.size();
    }

    public void iniciarRastreamento(double lat, double lon) {
        for (Hunter h : hunters) {
            System.out.println(h.rastrearLocal(lat, lon));
        }
    }
}

// Programa principal para teste
public class Main {
    public static void main(String[] args) {
        Especialista e1 = new Especialista("Gon", "Jajanken", "Yorknew", 14);
        Manipulador m1 = new Manipulador("Killua", e1, "Yorknew", 14);

        Batalhao b = new Batalhao();
        b.adicionarHunter(e1);
        b.adicionarHunter(m1);
        b.adicionarHunter(e1); // não será adicionado novamente

        System.out.println("Total de Hunters no Batalhão: " + b.getNumHunters());
        b.iniciarRastreamento(-3.14, -60.02);
    }
}
