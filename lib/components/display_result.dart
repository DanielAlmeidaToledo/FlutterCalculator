import 'package:flutter/material.dart';

Widget displayResult({required String result}) {
  return Container(
    height: 160,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    alignment: Alignment.bottomRight,
    decoration: const BoxDecoration(
      color: Colors.transparent,
      border: Border(
        bottom: BorderSide(color: Colors.white, width: 1.5),
        top: BorderSide(color: Colors.white, width: 1.5),
        right: BorderSide(color: Colors.white, width: 1.5),
        left: BorderSide(color: Colors.white, width: 1.5),
      ),
    ),
    child: Text(
      result,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 64,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
