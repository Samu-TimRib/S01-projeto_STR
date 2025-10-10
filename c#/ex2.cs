using System;
using System.Collections.Generic;

// 1. Crie uma classe base chamada Pokemon. Adicione um atributo Nome.
public class Pokemon
{
    public string Nome { get; set; }

    // 2. Crie um método virtual Atacar() na classe Pokemon com uma ação genérica.
    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} usou um ataque genérico!");
    }
}

// 3. Crie as classes PokemonDeFogo e PokemonDeAgua que herdem de Pokemon.
public class PokemonDeFogo : Pokemon
{
    // 4. Em cada classe filha, sobrescreva o método Atacar() para refletir o tipo.
    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de fogo!");
    }
}

public class PokemonDeAgua : Pokemon
{
    // 4. Em cada classe filha, sobrescreva o método Atacar() para refletir o tipo.
    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de água!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // 5. No main, crie uma lista de objetos do tipo da classe mãe (List<Pokemon>).
        List<Pokemon> pokemons = new List<Pokemon>();

        // 6. Adicione as instâncias de Charizard e Blastoise à lista.
        PokemonDeFogo charizard = new PokemonDeFogo { Nome = "Charizard" };
        PokemonDeAgua blastoise = new PokemonDeAgua { Nome = "Blastoise" };

        pokemons.Add(charizard);
        pokemons.Add(blastoise);

        // em seguida, percorra essa lista para chamar o método Atacar() de cada um.
        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }
    }
}
