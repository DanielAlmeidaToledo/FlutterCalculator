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
      String formattedDecimalPart = decimalPart.replaceAll(RegExp(r'0+$'), '');
      formattedResult = formattedDecimalPart.isEmpty
          ? '$integerPart.'
          : '$integerPart.$formattedDecimalPart';
    }

    return formattedResult;
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isEmpty) {
    return "$number1 $operation";
  } else if (number1.isNotEmpty && operation.isNotEmpty && number2.isNotEmpty) {
    return "$number1 $operation $number2";
  }

  // Valida se o resultado é maior que 10 caracteres
  if (result.toString().length > 10) {
    return formatLargeResult(result.toDouble());
  }

  return result.toString();
}

String formatLargeResult(double result) {
  int precision = 10;

  NumberFormat formatter = NumberFormat.decimalPattern('en-US');
  String formattedResult = formatter.format(result);

  if (result.abs() >= 1e9 || result.abs() <= 1e-9) {
    formattedResult = result.toStringAsPrecision(precision);
  }

  return formattedResult;
}
