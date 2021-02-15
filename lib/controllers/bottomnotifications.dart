import 'package:flutter/material.dart';

class BottomNotifications with ChangeNotifier {
  List<String> litems = [];

  void addNotification(String text) {
    litems.add(text);
    print('in add notification');
    notifyListeners();
  }

  void clear() {
    litems.clear();
    notifyListeners();
  }
}
