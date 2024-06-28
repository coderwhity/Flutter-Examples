import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _name = "";

  // Getter
  String get getName => _name;

  // Function to set value
  void setName(String value) {
    _name = value;
    notifyListeners();
  }
}
