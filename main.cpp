#include <iostream>

using namespace std;

int main()
{
    cout << "=== Calculadora ===\n1) Suma\n2) Resta\n3) Multiplicación\n4) División" << endl;
    cout << "Ingrese una opción: ";
    int opcion;
    cin >> opcion;
    cout << "Ingrese el primer número: ";
    float a;
    cin >> a;
    cout << "Ingrese el segundo número: ";
    float b;
    cin >> b;
    float resultado;
    switch (opcion)
    {
    case 1:
        resultado = a + b;
        break;
    case 2:
        resultado = a - b;
        break;
    case 3:
        resultado = a * b;
        break;
    case 4:
        resultado = a / b;
        break;
    default:
        cout << "Opción inválida" << endl;
        return 1;
    }
    cout << "El resultado es: " << resultado << endl;
    return 0;
}