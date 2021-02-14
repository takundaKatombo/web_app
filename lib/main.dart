import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/services/locator.dart';
import 'package:web_app/services/route_generator.dart';
import 'package:web_app/views/pages/homepage.dart';

GetIt getIt = GetIt.instance;
void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNotifications>(
      create: (_) => BottomNotifications(),
      child: MaterialApp(
        title: 'Web App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
