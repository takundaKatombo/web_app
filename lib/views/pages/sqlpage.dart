import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/services/locator.dart';

// Page vars
String sqlUpdateText;

class SQLPage extends StatelessWidget {
  const SQLPage({
    Key key,
  }) : super(key: key);

  SQLPage.forDesignTime();

  @override
  Widget build(BuildContext context) {
    var litems = Provider.of<BottomNotifications>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Example 1 :  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                          "update cable_drums set manu_batch_num = '123'  where  drum_id='_1404900531742'",
                          overflow: TextOverflow.visible))),
            ],
          ),
        ), //End child 1
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Example 2 :  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                          "update stock_bins_history set trans_date = to_timestamp('2004/11/29 14:30:15', 'YYYY/MM/DD HH24:MI:SS')  where trans_hist_id = '1_1404900531600'",
                          overflow: TextOverflow.visible))),
            ],
          ),
        ), //End child 2

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (text) {
                    sqlUpdateText = text;
                  },
                  decoration: InputDecoration(hintText: 'Enter your sql here')),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
              elevation: 4.0,
              splashColor: Colors.yellow,
              onPressed: executeJob,
              child: Text('Execute')),
        )
      ],
    );
  }
}

Future<String> executeJob() async {
  List<dynamic> entityElements = [sqlUpdateText];
//  List resultElements = await getElementsFromServer(isPost: true, entityElements: entityElements, endPoint: ConfigData().siteControlURL, methodToCall: Constants.METHOD_GENERIC_SYNC_SQL);

  List<dynamic> resultElements = ['testValue'];

  if (resultElements != null) {
    for (int i = 0; i < resultElements.length; i++) {
      //Todo Populate some field if required
      locator<BottomNotifications>().addNotification('Execute pressed ');
    }
    //

  }

//  print(sqlUpdateText);
}
