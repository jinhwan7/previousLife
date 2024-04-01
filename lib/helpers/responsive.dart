import 'package:flutter/material.dart';

class Responsive {
  static double totalWidth = 0;
  static double totalHeight = 0;
  static width(double p, BuildContext context) {
    return totalWidth * (p / 100);
  }

  static height(double p, BuildContext context) {
    return totalHeight * (p / 100);
  }
}
