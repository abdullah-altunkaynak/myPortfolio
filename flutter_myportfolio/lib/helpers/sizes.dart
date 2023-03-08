import 'package:flutter/material.dart';

class Sizes {
  static double _width = 1080;
  static double _height = 1920;

  static void setSizes(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  static double getWidth() {
    return _width;
  }

  static double getHeight() {
    return _height;
  }
}
