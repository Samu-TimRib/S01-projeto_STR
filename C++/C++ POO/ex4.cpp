#include <iostream>
#include <string>
using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}

    virtual void apresentar() {
        cout << "Ola, eu sou " << nome << " e sou um ser vivo." << endl;
    }
};


class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}

    void apresentar() {
        cout << "Ola, eu sou " << nome << " e pertenço a raca Humana." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}

    void apresentar() {
        // Latim
        cout << "Salve, nomen mihi est " << nome 
             << " et ego sum Elfus silvae." << endl;
        // (tradução: "Saudacoes, meu nome é X e eu sou um Elfo da floresta")
    }
};

class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}

    void apresentar() {
        // Gaélico/Celta estilizado
        cout << "Sioraiocht mhaith! Is mise " << nome 
             << " agus is banfhaidh draiochta me." << endl;
        // (tradução: "Boa magia! Eu sou X e sou uma fada mágica.")
    }
};

int main() {
    SerVivo* lista[3];

    Humano h("Arthur");
    Elfo e("Legolas");
    Fada f("Tinkerbell");

    lista[0] = &h;
    lista[1] = &e;
    lista[2] = &f;

    cout << "=== Apresentações dos Seres Vivos ===" << endl;
    for (int i = 0; i < 3; i++) {
        lista[i]->apresentar();
    }

    return 0;
}
