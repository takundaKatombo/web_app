import 'package:web_app/Model/LoginDetails.dart';
import 'package:web_app/model/ConfigData.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  TempLogin _login = TempLogin();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'Username', labelText: 'Username'),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password', labelText: 'Password'),
              )),
          ElevatedButton(
            //comment
            onPressed: () {
              doLogin()
                  ? Navigator.pushNamed(context, '/home')
                  : showAlertDialog(context);
            },
            child: Text('Login'),
          ),
        ])),
      ),
    );
  }

  bool doLogin() {
    if (((usernameController.text == _login.paul.userName) &&
            (passwordController.text == _login.paul.password)) ||
        ((usernameController.text == _login.tom.userName) &&
            (passwordController.text == _login.tom.password))) {
      // todo this is just temp setting of a user
      if (usernameController.text == "paul") {
        // Set Paul user
        ConfigData().clientIp = _login.paul.clientIPAddress;
        ConfigData().loggedInUserName = _login.paul.userName;
        ConfigData().loggedInUserID = _login.paul.userID;
        ConfigData().roles = _login.paul.roles;
        ConfigData().adminUser = ConfigData().roles.contains('cms_sysadmin');
      }

      if (usernameController.text == "tom") {
        // Set Tom user
        ConfigData().clientIp = _login.tom.clientIPAddress;
        ConfigData().loggedInUserName = _login.tom.userName;
        ConfigData().loggedInUserID = _login.tom.userID;
        ConfigData().roles = _login.tom.roles;
        ConfigData().adminUser = ConfigData().roles.contains('cms_sysadmin');
        //print(ConfigData().adminUser);
      }

      return true;
    } else
      return false;
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
      //     content: Text("Please retry!"),
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

//Temp test of login
class TempLogin {
  List<String> paulRoles = ['cms_site_admin'];
  List<String> tomRoles = [
    'cms_ww_read_only',
    'cms_project_admin',
    'cms_sysadmin'
  ];
  LoginDetails paul = LoginDetails(
      userID: 1,
      userName: 'paul',
      clientIPAddress: '127.0.0.1',
      password: 'paul1');
  LoginDetails tom = LoginDetails(
      userID: 1,
      userName: 'tom',
      clientIPAddress: '127.0.0.1',
      password: 'tom1');

  TempLogin() {
    paul.roles = paulRoles;
    tom.roles = tomRoles;
  }
}
