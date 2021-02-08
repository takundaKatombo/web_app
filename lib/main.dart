import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/views/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web App',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<BottomNotifications>(
        create: (_) => BottomNotifications(),
        child: MyHomePage(title: 'Web App',),
    ),);
  }
}

