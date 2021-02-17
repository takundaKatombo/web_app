import 'package:flutter/material.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/services/locator.dart';
import 'package:web_app/views/pages/future.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<bool> _data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(children: [
          Container(height: 50),
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Username', labelText: 'Username'),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Password', labelText: 'Password'),
              )),
          ElevatedButton(
            //comment
            onPressed: () {
              Navigator.pushNamed(context, '/home');
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => FutureDemoPage()));
            },
            child: Text('Login'),
          ),
          Container(height: 10),
          ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text('Login Failed'),
          )
        ])),
      ),
    );
  }

  Future<bool> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return true;
    });
  }

  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Login Failed"),
      content: Text("Error message"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> setLoginBool(bool login) async {
    if (login) {
      getData();
      Future.delayed(Duration(seconds: 1), () {
        locator<BottomNotifications>()
            .addNotification('back to login bool,delaying 2 seconds');
        return true;
      });
    } else {}
  }
}
