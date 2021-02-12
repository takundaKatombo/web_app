import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';

class SQLPage extends StatefulWidget {
  const SQLPage({
    Key key,
  }) : super(key: key);

  @override
  _SQLPageState createState() => _SQLPageState();
}

class _SQLPageState extends State<SQLPage> {
  var val = 1;

  @override
  Widget build(BuildContext context) {
    var litems = Provider.of<BottomNotifications>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Please Enter The Sql Below')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Tips')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Text Here')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Examples ')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Row(
            children: [
              Text('General Update'),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text('Sample Query'),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  // borderRadius: BorderRadius.circular(10.0),
                ),
              )
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Text('General Update'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text('Sample Text '),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    // borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Container(
            child: Text('Results Here'),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              // borderRadius: BorderRadius.circular(10.0),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                litems.addNotification('Execute pressed $val');
                val++;
              },
              child: Text('Execute')),
        ),
        Spacer(),
        Container()
      ],
    );
  }
}
