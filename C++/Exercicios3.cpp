#include <iostream>
using namespace std;

int main() {
    int totalNotas;
    float valorNota, acumulador = 0;

    cout << "Quantas notas deseja inserir? ";
    cin >> totalNotas;

    for (int contador = 0; contador < totalNotas; contador++) {
        cout << "Digite a nota " << contador + 1 << ": ";
        cin >> valorNota;

        while (valorNota < 0 || valorNota > 10) {
            cout << "Nota invalida! Digite novamente (0 a 10): ";
            cin >> valorNota;
        }

        acumulador += valorNota;
    }

    float resultadoMedia = acumulador / totalNotas;

    cout << "\nMedia final = " << resultadoMedia << endl;

    if (resultadoMedia >= 7) {
        cout << "Situacao: Aprovado" << endl;
    } else {
        cout << "Situacao: Reprovado" << endl;
    }

    return 0;
}
