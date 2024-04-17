// Função que calcula o resultado da calculadora
double calculateResult({
  required String number1,
  required String number2,
  required String operation,
}) {
  switch (operation) {
    case "+":
      return double.parse(number2) + double.parse(number2);
    case "-":
      return double.parse(number2) - double.parse(number2);
    case "x":
      return double.parse(number2) * double.parse(number2);
    case "÷":
      return double.parse(number2) / double.parse(number2);
    case "%":
      return double.parse(number2) % double.parse(number2);
    default:
      return 0.0;
  }
}

// Função que exibe o resultado da calculadora
String showResult({
  required String number1,
  required String number2,
  required String operation,
  required double result,
}) {
  if (number1 == "" && operation == "" && number2 == "") {
    return "0";
  } else if (number1 != "" && operation == "" && number2 == "") {
    return number1;
  } else if (number1 != "" && operation != "" && number2 == "") {
    return "$number1 $operation";
  } else if (number1 != "" &&
      operation != "" &&
      number2 != "" &&
      result == 0.0) {
    return "$number1 $operation $number2";
  }
  return "$result";
}