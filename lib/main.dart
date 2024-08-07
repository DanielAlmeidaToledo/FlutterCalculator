import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/services.dart';
import 'package:danieltoledo_bt3031926/components/display_buttons.dart';
import 'package:danieltoledo_bt3031926/components/display_result.dart';
import 'package:danieltoledo_bt3031926/enums/keys.dart';
import 'package:danieltoledo_bt3031926/enums/type_keys.dart';
import 'package:danieltoledo_bt3031926/utils/calculate.dart';
import 'package:danieltoledo_bt3031926/utils/result_logic.dart';

// Created by Daniel Toledo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixando a orientação do aplicativo
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.white,
          background: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _number1 = "";
  var _number2 = "";
  var _operation = "";
  var _result = Decimal.zero;
  var _resultText = "0";
  var _expression = "";

  void _calculate(Keys key) {
    setState(() {
      _number1 = _number1 == "Error" ? "" : _number1;
      _expression = _expression.contains("Error") ? "" : _expression;
    });

    // Limita o tamanho da expressão
    if (_expression.length < 50 ||
        key.typeKeys == TypeKeys.clear ||
        key.typeKeys == TypeKeys.delete ||
        key.typeKeys == TypeKeys.result) {
      switch (key.typeKeys) {
        case TypeKeys.number:
          setState(() {
            if (_operation.isEmpty) {
              if (_result != Decimal.zero) {
                _result = Decimal.zero;
                _expression = "";
              }
              if (_number1.length < 10) {
                if (key.textButton == '.') {
                  if (_number1.isEmpty) {
                    _number1 = '0.';
                    _expression += '0.';
                  } else if (!_number1.contains('.')) {
                    _number1 += key.textButton;
                    _expression += key.textButton;
                  }
                } else if (_number1 == "0") {
                  _number1 = key.textButton;
                  _expression = key.textButton;
                } else {
                  _number1 += key.textButton;
                  _expression += key.textButton;
                }
              }
            } else {
              if (_number2.length < 10) {
                if (key.textButton == '.') {
                  if (_number2.isEmpty) {
                    _number2 = '0.';
                    _expression += '0.';
                  } else if (!_number2.contains('.')) {
                    _number2 += key.textButton;
                    _expression += key.textButton;
                  }
                } else {
                  _number2 += key.textButton;
                  _expression += key.textButton;
                }
              }
            }
          });
          break;

        case TypeKeys.operation:
          setState(() {
            if (_operation.isNotEmpty && _number2.isNotEmpty) {
              _number1 = "";
              _number2 = "";
              _operation = key.textButton;
              _expression += ' ${key.textButton} ';
            } else if (key.textButton == '%') {
              _result = calculateResult(
                number1: _number1,
                number2: _number2,
                operation: key.textButton,
              );
              _number1 = _result.toString();
              _number2 = "";
              _operation = "";
              _expression = _number1;
            } else if (_number1.isEmpty) {
              _number1 = "0";
              _operation = key.textButton;
              _expression = "0 ${key.textButton} ";
            } else {
              _operation = key.textButton;
              _expression += ' ${key.textButton} ';
            }
          });
          break;

        case TypeKeys.result:
          setState(() {
            if (_number1.isNotEmpty && _operation.isEmpty && _number2.isEmpty) {
              _result = Decimal.parse(_number1);
            } else {
              if (_number2.isEmpty &&
                  _number1.isNotEmpty &&
                  _operation.isNotEmpty) {
                _number2 = _number1;
                _expression += '$_number2';
              }

              if (_operation == '÷' &&
                  Decimal.parse(_number2) == Decimal.zero) {
                _result = Decimal.zero;
                _number1 = "Error";
                _operation = "";
              } else if (RegExp(r'÷ 0 ').hasMatch(_expression)) {
                _result = Decimal.zero;
                _number1 = "Error";
                _operation = "";
              } else {
                try {
                  _result = evaluateExpression(_expression);
                  _number1 = _result.toString();
                } catch (e) {
                  _result = Decimal.zero;
                  _number1 = "Error";
                }
              }

              _number2 = "";
              _operation = "";
              _expression = _number1;
            }
          });
          break;

        case TypeKeys.delete:
          if (_expression.isEmpty) {
            return;
          }
          var deleteCount =
              _expression.length - (_expression.endsWith(' ') ? 2 : 1);
          setState(() {
            if (_number2.isNotEmpty) {
              _expression = _expression.substring(0, deleteCount);
              _number2 = _number2.substring(0, _number2.length - 1);
            } else if (_operation.isNotEmpty) {
              _expression = _expression.substring(0, deleteCount);
              _operation = "";
            } else if (_number1.isNotEmpty) {
              _expression = _expression.substring(0, deleteCount);
              _number1 = _number1.substring(0, _number1.length - 1);
            }
          });
          break;

        case TypeKeys.clear:
          setState(() {
            _result = Decimal.zero;
            _number1 = "";
            _number2 = "";
            _operation = "";
            _expression = "";
          });
          break;
      }
    }

    setState(() {
      _resultText = showResult(
        number1: _number1,
        number2: _number2,
        operation: _operation,
        result: _result,
        expression: _expression,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            displayResult(result: _resultText),
            displayButtons(calculate: _calculate)
          ],
        ),
      ),
    );
  }
}
