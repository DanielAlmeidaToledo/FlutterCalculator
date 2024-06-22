import 'package:danieltoledo_bt3031926/enums/type_keys.dart';

enum Keys {
  // Operations
  percentage(textButton: "%", typeKeys: TypeKeys.operation),
  divide(textButton: "÷", typeKeys: TypeKeys.operation),
  multiply(textButton: "x", typeKeys: TypeKeys.operation),
  add(textButton: "+", typeKeys: TypeKeys.operation),
  subtract(textButton: "-", typeKeys: TypeKeys.operation),
  // Result
  equal(textButton: "=", typeKeys: TypeKeys.result),
  // Delete
  delete(textButton: "del", typeKeys: TypeKeys.delete),
  // Clear
  reset(textButton: "C", typeKeys: TypeKeys.clear),
  // Numbers
  zero(textButton: "0", typeKeys: TypeKeys.number),
  one(textButton: "1", typeKeys: TypeKeys.number),
  two(textButton: "2", typeKeys: TypeKeys.number),
  three(textButton: "3", typeKeys: TypeKeys.number),
  four(textButton: "4", typeKeys: TypeKeys.number),
  five(textButton: "5", typeKeys: TypeKeys.number),
  six(textButton: "6", typeKeys: TypeKeys.number),
  seven(textButton: "7", typeKeys: TypeKeys.number),
  eight(textButton: "8", typeKeys: TypeKeys.number),
  nine(textButton: "9", typeKeys: TypeKeys.number),
  dot(textButton: ".", typeKeys: TypeKeys.number);

  const Keys({required this.textButton, this.typeKeys = TypeKeys.number});

  final String textButton;
  final TypeKeys typeKeys;
}
