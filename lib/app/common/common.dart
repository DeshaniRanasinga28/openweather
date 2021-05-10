import 'package:flutter/material.dart';

Widget textLabel(text, fontSize, color, fontWeight) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'Helvetica',
    ),
  );
}


Widget capitalLatterTextLabel(text, fontSize, color, fontWeight) {
  return Text(
    text.toString().toUpperCase(),
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'Helvetica',
    ),
  );
}

Widget containerView(text, fontSize, weight) {
  return  Container(
    alignment: Alignment.center,
    child: textLabel(text, fontSize, Colors.black, weight),
  );
}