import 'package:flutter/material.dart';
import 'package:danieltoledo_bt3031926/enums/keys.dart';
import 'package:danieltoledo_bt3031926/enums/type_keys.dart';

Widget buttonCalculator(
    {required Keys key, required void Function() onPressed}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: key.typeKeys == TypeKeys.result
            ? Colors.blue[800]
            : Colors.grey[900],
        fixedSize: const Size(160, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: Text(
        key.textButton,
        style: TextStyle(
          color: key.typeKeys == TypeKeys.operation
              ? Colors.blue[500]
              : Colors.white,
          fontSize: 24,
        ),
      ),
    ),
  );
}
