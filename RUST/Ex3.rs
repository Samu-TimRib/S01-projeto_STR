use std::io;

// Função que imprime a tabuada
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        let resultado = numero * i;
        println!("{} x {} = {}", numero, i, resultado);
    }
}

fn main() {
    let mut entrada = String::new();

    // Número da tabuada
    println!("Digite o número da tabuada:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).unwrap();
    let numero: i32 = entrada.trim().parse().unwrap();

    // Limite inferior
    println!("Digite o limite inferior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_inferior: i32 = entrada.trim().parse().unwrap();

    // Limite superior
    println!("Digite o limite superior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_superior: i32 = entrada.trim().parse().unwrap();

    // Chama a função
    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
