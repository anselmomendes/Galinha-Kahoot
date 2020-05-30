import 'package:flutter/material.dart';

Widget circularButton({String text, Function func}) {
  return RaisedButton(
    color: Colors.red,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: Colors.red)),
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
