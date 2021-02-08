import 'package:flutter/material.dart';

class BottomNotifications with ChangeNotifier
{ 
  
List<String> litems = [];


void addNotification(String text)
{
  litems.add(text);
  notifyListeners();
}

void clear()
{
  litems.clear();
  notifyListeners();
}

}