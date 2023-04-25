class Main {

    public static void main(String[] args) {
        System.out.println("=== Calculadora ===\n1) Suma\n2) Resta\n3) Multiplicación\n4) División\n5) Salir\n");
        System.out.print("Opción: ");
        int opcion = Integer.parseInt(System.console().readLine());
        if (opcion == 5) {
            System.exit(0);
        }
        System.out.print("Primer número: ");
        float num1 = Float.parseFloat(System.console().readLine());
        System.out.print("Segundo número: ");
        float num2 = Float.parseFloat(System.console().readLine());
        float resultado = 0;
        switch (opcion) {
            case 1:
                resultado = num1 + num2;
                break;
            case 2:
                resultado = num1 - num2;
                break;
            case 3:
                resultado = num1 * num2;
                break;
            case 4:
                resultado = num1 / num2;
                break;
            case 5:
                System.exit(0);
                break;
            default:
                System.out.println("Opción no válida");
                break;
        }
        System.out.println("Resultado: " + resultado);
    }
}