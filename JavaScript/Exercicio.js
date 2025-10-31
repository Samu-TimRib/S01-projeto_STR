class Pokemon {
  #vida; // atributo privado

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }
  
  getVida() {
    return this.#vida;
  }
  
  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida atual: ${this.#vida}`);
  }
  
  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}, mas o ataque é genérico.`);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 10 + this.bonusAtaque;
    console.log(`${this.nome} lança uma labareda em ${alvo.nome} causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 8;
    console.log(`${this.nome} dispara um jato d'água em ${alvo.nome} causando ${dano} de dano!`);
    alvo.receberDano(dano);
    this.curar();
  }

  curar() {
    console.log(`${this.nome} recupera ${this.#curaBase} de vida ao se refrescar!`);
    const novaVida = this.getVida() + this.#curaBase;
    // atualiza internamente via receberDano negativo
    this.receberDano(-this.#curaBase);
  }
}

// Demonstração
const charmander = new PokemonFogo("Charmander", 50, 5);
const squirtle = new PokemonAgua("Squirtle", 55, 4);

console.log("\n=== Início da Batalha ===\n");
charmander.atacar(squirtle);
squirtle.atacar(charmander);
charmander.atacar(squirtle);
