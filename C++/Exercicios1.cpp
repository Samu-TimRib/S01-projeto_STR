#include <iostream>
using namespace std;

int fibonacci(int termo) {
    if (termo == 0) {
        return 0;
    } else if (termo == 1) {
        return 1;
    } else {
        return fibonacci(termo - 1) + fibonacci(termo - 2);
    }
}

int main() {
    int numero;

    cout << "Digite um numero inteiro: ";
    cin >> numero;

    cout << "O " << numero << " numero de Fibonacci e: " << fibonacci(numero) << endl;

    return 0;
}
