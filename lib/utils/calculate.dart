// Função que calcula o resultado da calculadora
double calculateResult({
  required String number1,
  required String number2,
  required String operation,
}) {
  var n1 = double.parse(number1);
  var n2 = double.parse(number2);

  switch (operation) {
    case "+":
      return n1 + n2;
    case "-":
      return n1 - n2;
    case "x":
      return n1 * n2;
    case "÷":
      return n1 / n2;
    case "%":
      return n1 / 100;
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
    return number1.endsWith(".0")
        ? number1.substring(0, number1.length - 2)
        : number1;
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isEmpty) {
    return "$number1 $operation";
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isNotEmpty) {
    return "$number1 $operation $number2";
  }

  return result.toString();
}
