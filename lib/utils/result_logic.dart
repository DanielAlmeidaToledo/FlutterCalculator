import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

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
      // Se o resultado conter um ponto decimal
      List<String> parts = formattedResult.split('.');
      String integerPart = parts[0];
      String decimalPart = parts[1];
      // Remove os zeros à direita da parte decimal
      formattedResult =
          decimalPart.isEmpty ? '$integerPart.' : '$integerPart.$decimalPart';
    }

    if (result.toString().length > 10) {
      return formatLargeResult(Decimal.parse(formattedResult).toDouble());
    }
    return formattedResult;
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isEmpty) {
    var numberFormatted = number1.length > 10
        ? formatLargeResult(Decimal.parse(number1).toDouble())
        : number1;
    return "$numberFormatted $operation";
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isNotEmpty) {
    var numberFormatted = number1.length > 10
        ? formatLargeResult(Decimal.parse(number1).toDouble())
        : number1;
    return "$numberFormatted $operation $number2";
  }

  return result.toString();
}

String formatLargeResult(double result) {
  int precision;
  String formattedResult;

  // Define a precisão com base no valor absoluto do resultado
  if (result.abs() >= 1e9 || result.abs() <= 1e-9) {
    precision = 10;
  } else if (result.abs() >= 1e6 || result.abs() <= 1e-6) {
    precision = 7;
  } else if (result.abs() >= 1e3 || result.abs() <= 1e-3) {
    precision = 5;
  } else {
    precision = 6;
  }

  // Usa a notação científica para valores muito grandes ou pequenos
  if (result.abs() >= 1e9 || result.abs() <= 1e-9) {
    formattedResult = result.toStringAsPrecision(precision);
  } else {
    formattedResult = result.toStringAsFixed(precision);
  }

  // Usa a notação científica para valores muito grandes
  if (result.abs() >= 1e3 && result.abs() < 1e9) {
    NumberFormat formatter = NumberFormat.decimalPattern('en-US');
    formattedResult = formatter.format(result);
  }

  return formattedResult;
}
