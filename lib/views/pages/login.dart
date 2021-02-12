import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            onPressed: () {
              loginCall(1)
                  ? Navigator.pushNamed(context, '/home')
                  : showAlertDialog(context);
            },
            child: Text('Login'),
          ),
          Container(height: 10),
          ElevatedButton(
            onPressed: () {
              loginCall(0)
                  ? Navigator.pushNamed(context, '/home')
                  : showAlertDialog(context);
            },
            child: Text('Login Failed'),
          )
        ])),
      ),
    );
  }

  bool loginCall(int val) {
    if (val == 1)
      return true;
    else
      return false;
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
}
