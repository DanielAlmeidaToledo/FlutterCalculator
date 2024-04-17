import 'package:flutter/material.dart';
import 'package:flutter_calculator/enums/keys.dart';
import 'package:flutter_calculator/enums/type_keys.dart';

Widget buttonCalculator(
    {required Keys key, required void Function() onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize:
          key.textButton == "0" ? const Size(190, 90) : const Size(90, 90),
      backgroundColor:
          key.typeKeys == TypeKeys.result ? Colors.blue : Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    child: Text(
      key.textButton,
      style: TextStyle(
        color: key.typeKeys == TypeKeys.operation ? Colors.blue : Colors.white,
        fontSize: 20,
      ),
    ),
  );
}
