import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:danieltoledo_bt3031926/components/display_buttons.dart';
import 'package:danieltoledo_bt3031926/components/display_result.dart';
import 'package:danieltoledo_bt3031926/enums/keys.dart';
import 'package:danieltoledo_bt3031926/enums/type_keys.dart';
import 'package:danieltoledo_bt3031926/utils/calculate.dart';

// Created by Daniel Toledo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  void _calculate(Keys key) {
    setState(() {
      _number1 = _number1 == "Error" ? "" : _number1;
    });

    switch (key.typeKeys) {
      case TypeKeys.number:
        setState(() {
          if (_operation.isEmpty) {
            if (_result != 0.0) {
              _result = Decimal.zero;
            }
            if (!(key.textButton == '.' && _number1.contains('.'))) {
              _number1 += key.textButton;
            }
          } else {
            if (!(key.textButton == '.' && _number2.contains('.'))) {
              _number2 += key.textButton;
            }
          }
        });
        break;

      case TypeKeys.operation:
        setState(() {
          if (_operation.isNotEmpty && _number2.isNotEmpty) {
            _result = calculateResult(
              number1: _number1,
              number2: _number2,
              operation: _operation,
            );
            _number1 = _result.toString();
            _number2 = "";
            _operation = key.textButton;
          } else if (_number1.isEmpty) {
            _number1 = "0";
            _operation = key.textButton;
          } else {
            _operation = key.textButton;
          }
        });
        break;

      case TypeKeys.result:
        setState(() {
          if (_number2.isEmpty) {
            setState(() {
              _number2 = _number1;
            });
          }

          _result = calculateResult(
            number1: _number1,
            number2: _number2,
            operation: _operation,
          );

          if (_result.toDouble().isNaN || _result.toDouble().isInfinite) {
            _result = Decimal.zero;
            _number1 = "Error";
          } else {
            _number1 = _result.toString();
          }

          _number2 = "";
          _operation = "";
        });
        break;

      case TypeKeys.delete:
        setState(() {
          if (_number2.isNotEmpty) {
            _number2 = _number2.substring(0, _number2.length - 1);
          } else if (_operation.isNotEmpty) {
            _operation = "";
          } else if (_number1.isNotEmpty) {
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
        });
        break;
    }

    setState(() {
      _resultText = showResult(
        number1: _number1,
        number2: _number2,
        operation: _operation,
        result: _result,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
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
