// Função que calcula o resultado da calculadora
double calculateResult({
  required String number1,
  required String number2,
  required String operation,
}) {
  switch (operation) {
    case "+":
      print(double.parse(number1));
      print(double.parse(number2));
      print(double.parse(number1) + double.parse(number2));
      return double.parse(number1) + double.parse(number2);
    case "-":
      return double.parse(number1) - double.parse(number2);
    case "x":
      return double.parse(number1) * double.parse(number2);
    case "÷":
      return double.parse(number1) / double.parse(number2);
    case "%":
      return double.parse(number1) / 100;
    default:
      return 0;
  }
}

// Função que exibe o resultado da calculadora
String showResult({
  required String number1,
  required String number2,
  required String operation,
  required double result,
}) {
  if (number1.isEmpty && operation.isEmpty && number2.isEmpty) {
    return "0";
  } else if (number1.isNotEmpty && operation.isEmpty && number2.isEmpty) {
    return number1;
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isEmpty) {
    return "$number1 $operation";
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isNotEmpty) {
    return "$number1 $operation $number2";
  }

//   print(result.abs());
//   // Verifica se o resultado é muito grande para ser exibido normalmente
//   if (result.abs() >= 1e10 || result.abs() <= 1e-10) {
//     // Formata o resultado para notação científica com 5 casas decimais
//     return result.toStringAsExponential(5);
//   } else {
//     // Formata o resultado com 10 casas decimais
//     return result.toStringAsFixed(10);
//   }
  return result.toString();
}
