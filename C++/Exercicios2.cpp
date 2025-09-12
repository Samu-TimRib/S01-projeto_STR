#include <iostream>
using namespace std;

float somarArray(float vetor[], int qtdElementos) {
    float acumulador = 0;

    for (int indice = 0; indice < qtdElementos; indice++) {
        acumulador += vetor[indice];
    }

    return acumulador;
}

int main() {
    int quantidade;

    cout << "Digite o tamanho do vetor: ";
    cin >> quantidade;

    float numeros[quantidade];

    for (int i = 0; i < quantidade; i++) {
        cout << "Digite o numero " << i + 1 << ": ";
        cin >> numeros[i];
    }

    cout << "Valor somado do vetor eh " << somarArray(numeros, quantidade);

    return 0;
}
