import 'package:flutter/material.dart';

class BottomNotifications extends ChangeNotifier {
  List<String> litems = [];

  void addNotification(String text) {
    litems.add(text);
   // print('in add notification');
    notifyListeners();
  }

  void clear() {
    litems.clear();
    notifyListeners();
  }
}
