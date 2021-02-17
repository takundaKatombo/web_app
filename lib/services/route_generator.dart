import 'package:flutter/material.dart';
import 'package:web_app/views/pages/future.dart';
import 'package:web_app/views/pages/homepage.dart';
import 'package:web_app/views/pages/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case '/':
        return MaterialPageRoute(builder: (context) => FutureDemoPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
