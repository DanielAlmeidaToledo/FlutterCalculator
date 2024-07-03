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

// Função que avalia a expressão matemática
Decimal evaluateExpression(String expression) {
  // Divide a expressão em tokens
  List<String> tokens = expression.trim().split(' ');

  // Verifica se a expressão termina com um operador
  if (tokens.length > 1 &&
      (tokens.last == '+' ||
          tokens.last == '-' ||
          tokens.last == 'x' ||
          tokens.last == '÷')) {
    // Duplica o penúltimo número no final da expressão
    tokens.add(tokens[tokens.length - 2]);
  }

  // Trata multiplicação, divisão e porcentagem primeiro
  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == 'x' || tokens[i] == '÷' || tokens[i] == '%') {
      if (tokens[i] == '%') {
        // Calcula a porcentagem
        Decimal number1 = Decimal.parse(tokens[i - 1]);
        Decimal percent = Decimal.parse(tokens[i + 1]) * Decimal.parse("0.01");
        Decimal result = number1 * percent;

        // Substitui os tokens pelo resultado da porcentagem
        tokens[i - 1] = result.toString();
        tokens.removeAt(i); // Remove o operador %
        i--;
      } else {
        // Calcula multiplicação ou divisão
        Decimal result = calculateResult(
          number1: tokens[i - 1],
          number2: tokens[i + 1],
          operation: tokens[i],
        );

        // Substitui os tokens pelo resultado
        tokens[i - 1] = result.toString();
        tokens.removeAt(i); // Remove o operador
        tokens.removeAt(i); // Remove o número 2
        i--;
      }
    }
  }

  // Trata adição e subtração
  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '+' || tokens[i] == '-') {
      Decimal result = calculateResult(
        number1: tokens[i - 1],
        number2: tokens[i + 1],
        operation: tokens[i],
      );

      // Substitui os tokens pelo resultado
      tokens[i - 1] = result.toString();
      tokens.removeAt(i); // Remove o operador
      tokens.removeAt(i); // Remove o numero 2
      i--;
    }
  }

  return Decimal.parse(tokens[0]);
}
