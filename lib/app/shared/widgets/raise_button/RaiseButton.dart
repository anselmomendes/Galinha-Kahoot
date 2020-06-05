import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

Widget circularButton({String text, Function func}) {
  return RaisedButton(
    color: appContrastColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: appContrastColor)),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    onPressed: func,
  );
}
