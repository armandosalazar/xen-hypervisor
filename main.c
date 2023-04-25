#include <stdio.h>

int main() {
	printf("=== Calculadora ===\n1) Suma\n2) Resta\n3) Multiplicacion\n4) Division\n5) Salir\n");
	int option;
	printf("Ingrese una opcion: ");
	scanf("%d", &option);
	if (option == 5) {
		return 0;
	}

	printf("Ingrese el primer numero: ");
	float num1;
	scanf("%f", &num1);
	printf("Ingrese el segundo numero: ");
	float num2;
	scanf("%f", &num2);

	float result;

	switch (option) {
		case 1:
			result = num1 + num2;
			break;
		case 2:
			result = num1 - num2;
			break;
		case 3:
			result = num1 * num2;
			break;
		case 4:
			result = num1 / num2;
			break;
		default:
			printf("Opcion invalida\n");
			return 1;
	}

	printf("El resultado es: %0.2f\n", result);
	return 0;
}
