using System;

// 1. Crie uma classe base abstrata chamada MonstroSombrio.
public abstract class MonstroSombrio
{
    public string Nome { get; set; }

    // Adicione um método virtual Mover().
    public abstract void Mover();
}

// 2. Crie as classes Zumbi e Espectro que herdem de MonstroSombrio.
public class Zumbi : MonstroSombrio
{
    // 3. Sobrescreva o método Mover() em ambas as classes.
    public override void Mover()
    {
        Console.WriteLine($"{Nome} se arrasta lentamente...");
    }
}

public class Espectro : MonstroSombrio
{
    // 3. Sobrescreva o método Mover() em ambas as classes.
    public override void Mover()
    {
        Console.WriteLine($"{Nome} flutua rapidamente pelas paredes!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // 4. No main, declare um array do tipo da classe mãe (MonstroSombrio[])
        // e preencha-o com pelo menos uma instância de Zumbi e uma de Espectro.
        MonstroSombrio[] horda = new MonstroSombrio[]
        {
            new Zumbi { Nome = "Zumbi Pútrido" },
            new Espectro { Nome = "Espectro Vingativo" },
            new Zumbi { Nome = "Zumbi Andarilho" }
        };

        // 5. Percorra o array e, para cada monstro, chame o método Mover().
        Console.WriteLine("A horda se aproxima!");
        foreach (var monstro in horda)
        {
            monstro.Mover();
        }
    }
}
