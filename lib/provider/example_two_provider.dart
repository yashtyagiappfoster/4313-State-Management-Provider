import 'package:flutter/material.dart';

class ExampleTwoProvider with ChangeNotifier {
  double _opacity = 1.0;

  double get opacity => _opacity;

  void setOpacity(double val) {
    _opacity = val;
    notifyListeners();
  }
}
