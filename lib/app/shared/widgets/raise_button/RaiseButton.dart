import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

Widget circularButton({String text, Function func, double sizeFont}) {
  
  return RaisedButton(
    // USADO EM TESTES
    // padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenWidth*0.015),
    // padding: screenWidth != null ? EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenWidth*0.015) : EdgeInsets.zero,
    color: appContrastColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: appContrastColor)),
    child: Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: sizeFont != null ? sizeFont : 18,
          color: Colors.white,
        ),
      ),
    ),
    onPressed: func,
  );
}
