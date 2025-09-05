use std::io;

fn verificar_senha(senha: &str) -> bool {
    
    if senha.len() < 8 {
        return false; //tem pelo menos 8 caracteres
    }

    let mut tem_numero = false;//vai verificar se tem pelo menos um numero
    let mut tem_maiuscula = false;//vai verificar se tem pelo menos uma letra maiuscula

    for c in senha.chars() {
        if c.is_ascii_digit() {
            tem_numero = true;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }

    tem_numero && tem_maiuscula
}

fn main() {
    let mut senha = String::new();

    loop {
        println!("Digite uma senha:");

        senha.clear(); // limpa o buffer antes de ler de novo tipo a  liguagem c++
        io::stdin()
            .read_line(&mut senha)
            .expect("Erro ao ler a entrada");

        // remove espaços e quebras de linha
        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break; // sai do loop quando a senha é válida
        } else {
            println!("Senha inválida. Tente novamente.");
        }
    }
}
