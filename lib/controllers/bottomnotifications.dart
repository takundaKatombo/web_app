import 'package:flutter/material.dart';

class BottomNotifications extends ChangeNotifier {
  List<String> litems = [];
  List<Color> colorCodes = [];
  Color fontCol = Colors.black;
  void addNotification(String text, bool success) {
    litems.add(text);
    if (! success ) fontCol = Colors.red;
    if (success) fontCol = Colors.green;
    colorCodes.add(fontCol);
    notifyListeners();
  }

  void clear() {
    litems.clear();
    colorCodes.clear();
    notifyListeners();
  }
}
