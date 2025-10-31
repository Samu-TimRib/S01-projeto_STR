class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;
  #enigmas;
  #criaturasAvistadas;
  
  constructor(autor) {
    this.#autorSecreto = autor;
    this.#enigmas = new Map();
    this.#criaturasAvistadas = [];
  }
  
  getAutor() {
    return this.#autorSecreto;
  }
  
  adicionarEnigma(num, enigma) {
    this.#enigmas.set(num, enigma);
    console.log(`Enigma ${num} adicionado ao diário!`);
  }
  
  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Chave incorreta.";
    }
    if (!this.#enigmas.has(num)) {
      return "Enigma não encontrado!";
    }
      const enigma = this.#enigmas.get(num);
      return `Enigma ${num} decodificado: "${enigma}"`;
  }
  
  registrarCriatura(criatura) {
    this.#criaturasAvistadas.push(criatura);
    console.log(`${criatura.nome} registrada no diário.`);
  }
  
    listarCriaturas() {
      return this.#criaturasAvistadas.map(c =>`${c.nome} (${c.perigosa ? "Perigosa" : "Inofensiva"})`);
    }
  }
  
class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}
  
class Protagonista extends Personagem {
  constructor(nome, idade, autorDiario) {
    super(nome, idade);
    this.diario = new Diario(autorDiario);
  }
}
  
class CabanaMisterio {
  constructor() {
    this.visitantes = [];
    this.funcionarios = [];
  }
  
  adicionarFuncionario(personagem) {
    if (personagem instanceof Personagem) {
      this.funcionarios.push(personagem);
      console.log(`${personagem.nome} começou a trabalhar na Cabana Mistério.`);
    }
  }
  
  listarFuncionarios() {
    return this.funcionarios.map(p => `${p.nome}, ${p.idade} anos`);
  }
}

// Demonstração do funcionamento
const dipper = new Protagonista("Dipper Pines", 12, "Autor_03");
dipper.diario.adicionarEnigma(1, "Use luz ultravioleta para revelar o símbolo secreto.");
dipper.diario.adicionarEnigma(2, "O livro 3 contém a chave do portal.");

console.log(dipper.diario.decodificar("Autor_03", 1));

const gnomo = new Criatura("Gnomo", false);
const bill = new Criatura("Bill Cipher", true);
dipper.diario.registrarCriatura(gnomo);
dipper.diario.registrarCriatura(bill);
console.log("Criaturas registradas:", dipper.diario.listarCriaturas());

const cabana = new CabanaMisterio();
cabana.adicionarFuncionario(dipper);
cabana.adicionarFuncionario(new Personagem("Soos Ramirez", 22));
cabana.adicionarFuncionario(new Personagem("Wendy Corduroy", 16));

console.log("\nFuncionários da Cabana Mistério:");
console.log(cabana.listarFuncionarios());
