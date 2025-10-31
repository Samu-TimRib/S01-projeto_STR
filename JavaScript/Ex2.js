/**

* Interface simulada — apenas como contrato
* (em JS, interfaces não existem, mas podemos forçar a implementação)
  */
  class IExplorador {
    explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado.");
    }
  }

// Classe do equipamento ODM (composição do Soldado)
class ODM_Gear {
  #gasRestante;
  
  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100; // inicia cheio
  }

  usarGas(quantidade) {
    this.#gasRestante -= quantidade;
    if (this.#gasRestante < 0) this.#gasRestante = 0;
    console.log(`[${this.modelo}] Gás usado: ${quantidade}. Restante: ${this.#gasRestante}%`);
  }

  getGas() {
    return this.#gasRestante;
    }
  }

// Soldado implementa a interface IExplorador
class Soldado extends IExplorador {
  #gear;
  
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    if (this.#gear.getGas() <= 0) {
      return `${this.nome} está sem gás e não pode explorar!`;
    }
    this.#gear.usarGas(20);
    return `${this.nome} está explorando o território usando ${this.#gear.modelo}.`;
  }

  verificarEquipamento() {
    return `${this.nome} verifica o equipamento: ${this.#gear.modelo}, gás restante: ${this.#gear.getGas()}%.`;
  }
}

// Classe que agrega vários soldados
class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (!(soldado instanceof Soldado)) {
      console.log("Apenas soldados podem ser adicionados ao esquadrão!");
      return;
    }
    this.membros.push(soldado);
    console.log(`${soldado.nome} entrou no esquadrão!`);
  }

  explorarTerritorio() {
    console.log(`\n${this.lider.nome} ordena: "Explorem o território!"\n`);
    return this.membros.map(s => s.explorarTerritorio());
  }

  relatarStatus() {
  re  turn this.membros.map(s => s.verificarEquipamento());
  }
}

// Demonstração
const levi = new Soldado("Capitão Levi", "ODM Mk-III");
const mikasa = new Soldado("Mikasa Ackerman", "ODM Mk-II");
const armin = new Soldado("Armin Arlert", "ODM Mk-I");

const esquadrao = new Esquadrao(levi, [mikasa, armin]);

console.log("\n=== Início da missão ===");
console.log(esquadrao.explorarTerritorio());

console.log("\n=== Relatório de status ===");
console.log(esquadrao.relatarStatus());
