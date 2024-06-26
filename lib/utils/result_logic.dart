import 'package:decimal/decimal.dart';

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
    return formatLargeResult(result);
  }

  return result.toString();
}

String formatLargeResult(Decimal result) {
  String resultString = result.toString();

  // Se o resultado for maior que 10 caracteres, usar notação científica
  if (resultString.length > 10) {
    resultString =
        result.toStringAsExponential(9); // Ajusta para 10 caracteres no total
  }

  return resultString;
}
