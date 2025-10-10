using System;

// 1. Crie a classe MembroDaSociedade.
public class MembroDaSociedade
{
    // 2. Defina atributos para o nome, a raça e a função do membro. (todos privados)
    private string nome;
    private string raca;
    private string funcao;

    // 3. Crie um Construtor que obrigue a inicialização desses três atributos ao criar um novo membro.
    public MembroDaSociedade(string nome, string raca, string funcao)
    {
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }

    // 4. Crie um método Descrever() que imprima as informações completas do membro.
    public void Descrever()
    {
        Console.WriteLine($"Nome: {nome}, Raça: {raca}, Função: {funcao}");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // 5. No main, crie as instâncias de Aragorn (Humano, Guardião) e Legolas (Elfo, Arqueiro) usando o construtor
        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

        // e chame o método Descrever() em ambos.
        aragorn.Descrever();
        legolas.Descrever();
    }
}
