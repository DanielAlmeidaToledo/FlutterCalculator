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
        fixedSize: Size(key.textButton == '0' ? 160 : 0, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Text(
        key.textButton,
        style: TextStyle(
          color: key.typeKeys == TypeKeys.operation
              ? Colors.blue[500]
              : Colors.white,
          fontSize: key.typeKeys == TypeKeys.operation ? 24 : 20,
        ),
      ),
    ),
  );
}
