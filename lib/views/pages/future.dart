import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class FutureDemoPage extends StatefulWidget {
  @override
  _FutureDemoPageState createState() => _FutureDemoPageState();
}

class _FutureDemoPageState extends State<FutureDemoPage> {
  bool _saving = false;

  void _submit() {
    setState(() {
      _saving = true;
    });

    //Simulate a service call
    new Future.delayed(new Duration(seconds: 4), () {
      _saving = false;
      Navigator.pushNamed(context, '/home');
    });
  }

  Widget _buildWidget() {
    return new Form(
      child: Center(
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
            _submit();
          },
          child: Text('Login'),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () {
            _saving = !_saving;
          },
          child: Text('Login Failed'),
        )
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ModalProgressHUD(child: _buildWidget(), inAsyncCall: _saving),
    );
  }
}
