import 'package:flutter/material.dart';

Widget textFormFieldCustom({
  String labelText,
  String hintText,
  Icon icon,
  TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    maxLength: 40,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: icon,
    ),
  );
}
