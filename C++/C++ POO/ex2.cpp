#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
	
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }

    string getNome() {
        return nome;
    }

    void setNome(string n) {
        nome = n;
    }

    int getIdade() {
        return idade;
    }

    void setIdade(int i) {
        idade = i;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) {
        nivel = nv;
    }

    int getNivel() {
        return nivel;
    }

    void setNivel(int nv) {
        nivel = nv;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r < 0) r = 0;
        if (r > 10) r = 10;
        rank = r;
    }

    int getRank() {
        return rank;
    }

    void setRank(int r) {
        if (r >= 0 && r <= 10) {
            rank = r;
        }
    }
};

int main() {
	
    Protagonista protagonista("Makoto", 17, 5);

    Personagem aliado("Ryuji", 17, 7);

    cout << "=== Informações dos Personagens ===" << endl;
    cout << "Protagonista: " << protagonista.getNome()
         << " | Idade: " << protagonista.getIdade()
         << " | Nivel: " << protagonista.getNivel() << endl;

    cout << "Aliado: " << aliado.getNome()
         << " | Idade: " << aliado.getIdade()
         << " | Rank Social: " << aliado.getRank() << endl;

    return 0;
}
