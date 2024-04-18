import 'package:flutter/material.dart';
import 'package:flutter_calculator/enums/keys.dart';
import 'package:flutter_calculator/components/button_calculator.dart';

Widget displayButtons({required void Function(Keys key) calculate}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonCalculator(
            key: Keys.reset,
            onPressed: () {
              calculate(Keys.reset);
            },
          ),
          buttonCalculator(
            key: Keys.delete,
            onPressed: () {
              calculate(Keys.delete);
            },
          ),
          buttonCalculator(
            key: Keys.percentage,
            onPressed: () {
              calculate(Keys.percentage);
            },
          ),
          buttonCalculator(
            key: Keys.multiply,
            onPressed: () {
              calculate(Keys.multiply);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonCalculator(
            key: Keys.seven,
            onPressed: () {
              calculate(Keys.seven);
            },
          ),
          buttonCalculator(
            key: Keys.eight,
            onPressed: () {
              calculate(Keys.eight);
            },
          ),
          buttonCalculator(
            key: Keys.nine,
            onPressed: () {
              calculate(Keys.nine);
            },
          ),
          buttonCalculator(
            key: Keys.divide,
            onPressed: () {
              calculate(Keys.divide);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonCalculator(
            key: Keys.four,
            onPressed: () {
              calculate(Keys.four);
            },
          ),
          buttonCalculator(
            key: Keys.five,
            onPressed: () {
              calculate(Keys.five);
            },
          ),
          buttonCalculator(
            key: Keys.six,
            onPressed: () {
              calculate(Keys.six);
            },
          ),
          buttonCalculator(
            key: Keys.subtract,
            onPressed: () {
              calculate(Keys.subtract);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonCalculator(
            key: Keys.one,
            onPressed: () {
              calculate(Keys.one);
            },
          ),
          buttonCalculator(
            key: Keys.two,
            onPressed: () {
              calculate(Keys.two);
            },
          ),
          buttonCalculator(
            key: Keys.three,
            onPressed: () {
              calculate(Keys.three);
            },
          ),
          buttonCalculator(
            key: Keys.add,
            onPressed: () {
              calculate(Keys.add);
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonCalculator(
            key: Keys.zero,
            onPressed: () {
              calculate(Keys.zero);
            },
          ),
          buttonCalculator(
            key: Keys.dot,
            onPressed: () {
              calculate(Keys.dot);
            },
          ),
          buttonCalculator(
            key: Keys.equal,
            onPressed: () {
              calculate(Keys.equal);
            },
          ),
        ],
      ),
    ],
  );
}
