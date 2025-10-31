// Classe base Hunter
class Hunter {
  constructor(nome, localizacao, idade) {
    this.nome = nome;
    this.localizacao = localizacao;
    this.idade = idade;
  }

  rastrearLocal(latitude, longitude) {
    console.log(`${this.nome} rastreou o local em (${latitude}, ${longitude})`);
  }
}

// Subclasse Especialista
class Especialista extends Hunter {
  constructor(nome, habilidadeNen, localizacao, idade) {
    super(nome, localizacao, idade);
    this.habilidadeNen = habilidadeNen;
  }

  rastrearLocal(latitude, longitude) {
    console.log(`Especialista ${this.nome} usou ${this.habilidadeNen} para rastrear o local (${latitude}, ${longitude})`);
  }
}

// Subclasse Manipulador
class Manipulador extends Hunter {
  constructor(nome, alvo, localizacao, idade) {
    super(nome, localizacao, idade);
    this.alvo = alvo;
  }

  rastrearLocal(latitude, longitude) {
    console.log(`Manipulador ${this.nome} está rastreando ${this.alvo} em (${latitude}, ${longitude})`);
  }
}

// Teste
const e1 = new Especialista("Gon", "Jajanken", "Yorknew", 14);
const m1 = new Manipulador("Killua", "Gon", "Yorknew", 14);

e1.rastrearLocal(-3.14, -60.02);
m1.rastrearLocal(-6.98, -12);
