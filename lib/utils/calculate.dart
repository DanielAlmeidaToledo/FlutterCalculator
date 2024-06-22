import 'package:decimal/decimal.dart';

// Função que calcula o resultado da calculadora
Decimal calculateResult({
  required String number1,
  required String number2,
  required String operation,
}) {
  var n1 = Decimal.parse(number1);
  var n2 = Decimal.parse(number2);

  switch (operation) {
    case "+":
      return n1 + n2;
    case "-":
      return n1 - n2;
    case "x":
      return n1 * n2;
    case "÷":
      // return Decimal.parse((n1 / n2).toString());
      return n1 / n2;
    case "%":
      return n1 * Decimal.parse("0.01") * n2;
    default:
      return Decimal.zero;
  }
}

// Função que exibe o resultado da calculadora
String showResult({
  required String number1,
  required String number2,
  required String operation,
  required Decimal result,
}) {
  if (number1.isEmpty && operation.isEmpty && number2.isEmpty) {
    return "0";
  } else if (number1.isNotEmpty && operation.isEmpty && number2.isEmpty) {
    String formattedResult = number1;

    if (formattedResult.contains('.')) {
      // Se o resultado contiver um ponto decimal
      List<String> parts = formattedResult.split('.');
      String integerPart = parts[0];
      String decimalPart = parts[1];
      String formattedDecimalPart = decimalPart.replaceAll(RegExp(r'0+$'), '');
      formattedResult = formattedDecimalPart.isEmpty
          ? integerPart
          : '$integerPart.$formattedDecimalPart';
    }

    return formattedResult;
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isEmpty) {
    return "$number1 $operation";
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isNotEmpty) {
    return "$number1 $operation $number2";
  }

  return result.toString();
}
