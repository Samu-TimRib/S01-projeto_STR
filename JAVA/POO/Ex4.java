import java.util.LinkedHashSet;
import java.util.HashMap;

class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return nome + " (Dano: " + dano + ")";
    }
}

class Boss {
    protected String nome;
    protected String idBoss;
    protected String pontoFraco;
    protected LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Iniciando batalha contra " + nome + "!");
        System.out.println("Ponto fraco: " + pontoFraco);
        System.out.println("Ataques conhecidos:");
        for (PadraoAtaque a : moveset) {
            System.out.println(" - " + a);
        }
    }

    public String getIdBoss() {
        return idBoss;
    }
}

class BossMagico extends Boss {

    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println(" BOSS MÁGICO DETECTADO ");
        super.iniciarFase();
        System.out.println("Este boss utiliza ataques elementais místicos!");
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if(boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Boss com ID '" + idBoss + "' não encontrado na arena!");
        }
    }
}

public class Main {
    public static void main(String[] args) {

        BossMagico dragao = new BossMagico("Dragão Arcano", "D001", "Gelo");
        dragao.adicionarAtaque(new PadraoAtaque("Chama Arcana", 50));
        dragao.adicionarAtaque(new PadraoAtaque("Explosão Etérea", 85));

        Boss troll = new Boss("Troll da Montanha", "T007", "Fogo");
        troll.adicionarAtaque(new PadraoAtaque("Soco Pesado", 30));

        Batalha batalha = new Batalha();
        batalha.adicionarBoss(dragao);
        batalha.adicionarBoss(troll);

        batalha.iniciarBatalha("D001");
        System.out.println("-------");
        batalha.iniciarBatalha("T007");
    }
}
