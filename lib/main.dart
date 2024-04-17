import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/display_buttons.dart';
import 'package:flutter_calculator/components/display_result.dart';
import 'package:flutter_calculator/enums/keys.dart';
import 'package:flutter_calculator/enums/type_keys.dart';
import 'package:flutter_calculator/utils/calculate.dart';

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
          background: Colors.grey[800],
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
  var _result = 0.0;
  var _resultText = "";

  void _calculate(Keys key) {
    switch (key.typeKeys) {
      case TypeKeys.number:
        if (_operation.isEmpty) {
          setState(() {
            _number1 += key.textButton;
          });
        } else {
          setState(() {
            _number2 += key.textButton;
          });
        }
        break;
      case TypeKeys.operation:
        setState(() {
          _operation = key.textButton;
        });
        break;
      case TypeKeys.result:
        setState(() {
          _result = calculateResult(
            number1: _number1,
            number2: _number2,
            operation: _operation,
          );
          _number1 = _result.toString();
          _number2 = "";
          _operation = "";
        });
        break;
      case TypeKeys.delete:
        if (_operation.isEmpty) {
          setState(() {
            if (_number1.isNotEmpty) {
              _number1 = _number1.substring(0, _number1.length - 1);
            } else {
              _number1 = "";
            }
          });
        } else {
          setState(() {
            if (_number2.isNotEmpty) {
              _number2 = _number2.substring(0, _number2.length - 1);
            } else {
              _number2 = "";
            }
          });
        }
      case TypeKeys.clear:
        setState(() {
          _result = 0.0;
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
