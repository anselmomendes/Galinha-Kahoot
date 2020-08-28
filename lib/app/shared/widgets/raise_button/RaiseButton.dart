import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

Widget circularButton({String text, Function func, double sizeFont}) {
  
  return RaisedButton(
    // USADO EM TESTES
    // padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenWidth*0.015),
    // padding: screenWidth != null ? EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenWidth*0.015) : EdgeInsets.zero,
    color: Colors.blueAccent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color:Colors.blueAccent)),
    child: Container(
      margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 70.0,
          height: 40.0,
      child: Text(
        text,
        style: TextStyle(
          fontSize: sizeFont != null ? sizeFont : 20,
          color: Colors.white,
        ),
      ),
    ),
    onPressed: func,
  );
}
