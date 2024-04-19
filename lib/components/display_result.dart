import 'package:flutter/material.dart';

Widget displayResult({required String result}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      alignment: Alignment.bottomRight,
      child: Text(
        result,
        style: TextStyle(
          color: Colors.white,
          fontSize: result.length > 10 ? 48 : 64,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
