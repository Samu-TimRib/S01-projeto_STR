using System;
using System.Collections.Generic;

// 1. Crie a classe Feitico (Propriedades).
public class Feitico
{
    public string Nome { get; set; }
    public string Efeito { get; set; }
}

// 3. Crie a classe Ferramenta
public class Ferramenta
{
    public string Nome { get; set; }
}

// 2. Crie a classe Grimorio que compõe uma lista (List<Feitico>) de feitiços.
public class Grimorio
{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico feitico)
    {
        feiticos.Add(feitico);
        Console.WriteLine($"Feitiço '{feitico.Nome}' adicionado ao grimório.");
    }
}

// 4. Crie a classe Maga (Frieren) que compõe um Grimorio e agrega uma lista (List<Ferramenta>).
public class Maga
{
    public string Nome { get; }
    // Composição: O Grimório é criado junto com a Maga e não existe sem ela.
    public Grimorio Grimorio { get; } = new Grimorio();
    // Agregação: A lista de ferramentas é recebida de fora.
    public List<Ferramenta> Ferramentas { get; }

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Ferramentas = ferramentas;
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // 5. No main, crie uma lista de Ferramentas.
        List<Ferramenta> ferramentasIniciais = new List<Ferramenta>
        {
            new Ferramenta { Nome = "Pederneira" },
            new Ferramenta { Nome = "Faca" },
            new Ferramenta { Nome = "Lanterna" }
        };

        // Crie a instância de Maga (Frieren), passando a lista de Ferramentas (Agregação).
        Maga frieren = new Maga("Frieren", ferramentasIniciais);

        // 6. Adicione feitiços ao Grimório de Frieren
        frieren.Grimorio.AdicionarFeitico(new Feitico { Nome = "Bola de Fogo", Efeito = "Causa dano de fogo." });
        frieren.Grimorio.AdicionarFeitico(new Feitico { Nome = "Cura Leve", Efeito = "Restaura pontos de vida." });

        // e imprima o nome das ferramentas que ela agregou.
        Console.WriteLine($"\nFerramentas de {frieren.Nome}:");
        foreach (var ferramenta in frieren.Ferramentas)
        {
            Console.WriteLine($"- {ferramenta.Nome}");
        }
    }
}
