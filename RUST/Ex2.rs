use std::io;

fn eh_par(numero: i32) -> bool { //Função para verificar se o número é par
    if numero % 2 == 0 {
        true
    } else {
        false
    }
}

fn main() {
    let mut escolha = String::new();
    let mut numero1 = String::new();
    let mut numero2 = String::new();

    // Jogador 1 escolhe "par" ou "ímpar"
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    io::stdin().read_line(&mut escolha).unwrap();
    let escolha = escolha.trim().to_lowercase();

    // Jogador 1 digita um número
    println!("Jogador 1, digite um número:");
    io::stdin().read_line(&mut numero1).unwrap();
    let numero1: i32 = numero1.trim().parse().unwrap();

    // Jogador 2 digita um número
    println!("Jogador 2, digite um número:");
    io::stdin().read_line(&mut numero2).unwrap();
    let numero2: i32 = numero2.trim().parse().unwrap();

    // Calcula a soma
    let soma = numero1 + numero2;
    println!("A soma dos números é: {}", soma);

    // Verifica se a soma é par
    let soma_par = eh_par(soma);

    // Decide o vencedor
    if soma_par && escolha == "par" {
        println!("Jogador 1 venceu!");
    } else if !soma_par && escolha == "ímpar" {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
