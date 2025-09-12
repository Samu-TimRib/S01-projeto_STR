#include <iostream>
using namespace std;

double converterParaFahrenheit(double valorCelsius) {
    return (valorCelsius * 9.0 / 5.0) + 32.0;
}

double converterParaKelvin(double valorCelsius) {
    return valorCelsius + 273.15;
}

int main() {
    int escolha;
    double temperatura;

    do {
        cout << "1. Converter Celsius para Fahrenheit\n";
        cout << "2. Converter Celsius para Kelvin\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> escolha;

        switch (escolha) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> temperatura;
                cout << "Resultado: " << converterParaFahrenheit(temperatura) << " F\n";
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> temperatura;
                cout << "Resultado: " << converterParaKelvin(temperatura) << " K\n";
                break;

            case 3:
                cout << "Saindo...\n";
                break;

            default:
                cout << "Opcao invalida! Tente novamente.\n";
        }

    } while (escolha != 3);

    return 0;
}
