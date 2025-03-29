import 'package:flutter/material.dart';

TextStyle ebGaramondTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  Color? color,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: 'EB Garamond',
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
  );
}

// Example usage:
// Text(
//   'Hello, EB Garamond!',
//   style: ebGaramondTextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//     fontStyle: FontStyle.italic,
//     color: Colors.blue,
//   ),
// ),

// You can add more helper methods for other font styles if needed.
// Example for a title style:

TextStyle ebGaramondTitleStyle({
  double fontSize = 28,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.black,
}) {
  return ebGaramondTextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Example for a body text style:
TextStyle ebGaramondBodyStyle({
  double fontSize = 16,
  Color color = Colors.grey,
}) {
  return ebGaramondTextStyle(
    fontSize: fontSize,
    color: color,
  );
}