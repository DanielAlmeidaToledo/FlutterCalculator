import 'package:flutter/material.dart';

// Widget que exibe o resultado da calculadora
Widget displayResult({required String result}) {
  return Expanded(
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      alignment: Alignment.bottomRight,
      child: Text(
        result,
        style: TextStyle(
          color: Colors.white,
          fontSize: result.length > 10
              ? result.length > 16
                  ? 28
                  : 40
              : 54,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
