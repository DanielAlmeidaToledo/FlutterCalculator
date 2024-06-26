import 'package:decimal/decimal.dart';

// Função que calcula o resultado da calculadora
Decimal calculateResult({
  required String number1,
  required String number2,
  required String operation,
}) {
  var n1 = number1.isEmpty ? Decimal.zero : Decimal.parse(number1);
  var n2 = number2.isEmpty ? Decimal.zero : Decimal.parse(number2);

  switch (operation) {
    case "+":
      return n1 + n2;
    case "-":
      return n1 - n2;
    case "x":
      return n1 * n2;
    case "÷":
      return (n1 / n2).toDecimal(scaleOnInfinitePrecision: 20);
    case "%":
      return n1 * Decimal.parse("0.01");
    default:
      return Decimal.zero;
  }
}
