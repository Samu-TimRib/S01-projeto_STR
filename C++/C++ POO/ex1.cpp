#include <iostream>
#include <string>
using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;

    Personagem(string n, int nv, int d, int v) {
        nome = n;
        nivel = nv;
        dano = d;
        vida = v;
    }

    void atacar(Personagem &inimigo) {
        cout << nome << " atacou " << inimigo.nome << " causando " 
             << dano << " de dano!" << endl;
        inimigo.vida -= dano;
        if (inimigo.vida < 0) inimigo.vida = 0;
    }

    void mostrarInfo() {
        cout << "Nome: " << nome 
             << " | Nivel: " << nivel 
             << " | Dano: " << dano 
             << " | Vida: " << vida << endl;
    }
};

int main() {
	
    Personagem p1("Aragorn", 5, 20, 100);
    Personagem p2("Goblin", 2, 10, 60);
    
    // simulando um combate

    cout << "=== Antes do combate ===" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();

    cout << "\n--- Combate ---" << endl;
    p1.atacar(p2);
    p2.atacar(p1);

    cout << "\n=== Depois do combate ===" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();

    return 0;
}
