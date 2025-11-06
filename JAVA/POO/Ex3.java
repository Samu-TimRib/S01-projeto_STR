import java.util.HashMap;

// Interface Rastreadora
interface IRastreavel {
    String obterCoordenadas();
}

// Classe componente Poder
class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

// Classe base Entidades
abstract class Entidades implements IRastreavel {
    protected String nome;
    protected String localizacao;
    protected Poder poder;

    public Entidades(String nome, String local, Poder poder) {
        this.nome = nome;
        this.localizacao = local;
        this.poder = poder;
    }

    @Override
    public abstract String obterCoordenadas(); // será sobrescrito
}

// Classe Youkai
class Youkai extends Entidades {

    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai: " + nome + " visto em " + localizacao;
    }
}

// Classe Alien
class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planetaOrigem, String ovni, Poder poder) {
        super(nome, planetaOrigem, poder);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien: " + nome + " veio de " + planetaOrigem + " usando " + ovni;
    }
}

// Classe Registros (usa HashMap para evitar duplicatas)
class Registros {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade) {
        if(avistamentos.containsKey(entidade.nome)) {
            return false; // já registrado
        }
        avistamentos.put(entidade.nome, entidade);
        return true;
    }

    public void listarRegistros() {
        System.out.println("\n--- REGISTROS DA EQUIPE " + nomeEquipe + " ---");
        for(Entidades e : avistamentos.values()) {
            System.out.println(e.obterCoordenadas() + " | Poder: " + e.poder.getNome());
        }
    }
}

// MAIN
public class Main {
    public static void main(String[] args) {

        Poder invisibilidade = new Poder("Invisibilidade");
        Poder telepatia = new Poder("Telepatia");

        Entidades y1 = new Youkai("Kitsune", "Floresta de Kyoto", invisibilidade);
        Entidades a1 = new Alien("Zorg", "Marte", "Disco Voador", telepatia);

        Registros equipe = new Registros("Detetives Ocultos");

        equipe.registrarAvistamento(y1);
        equipe.registrarAvistamento(a1);
        equipe.registrarAvistamento(y1); // não deve registrar novamente

        equipe.listarRegistros(); // exibe os registros
    }
}
