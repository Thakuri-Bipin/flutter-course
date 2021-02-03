import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexcolor) : super(_getColorFromHex(hexcolor));
}

// How to use
/*

Color color1 = HexColor("b74093");
Color color2 = HexColor("#b74092");
Color color3 = HexColor("#88b74093"); // If you wish to use ARGB format

 */