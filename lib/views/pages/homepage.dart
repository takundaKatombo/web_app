import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/utils/GeneralUtils.dart';
import 'package:web_app/views/pages/admin/sqlpage.dart';
import 'package:web_app/views/pages/cable_drums/cabledrums.dart';
import 'package:web_app/views/pages/initiate_process/initiate_process.dart';
import 'package:web_app/views/widgets/tabview.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = ['Welcome Page'];
  int initPosition = 0;
  String dropdownValue = 'One';

  int _selectedtab;
  @override
  Widget build(BuildContext context) {
    var bottomNote = Provider.of<BottomNotifications>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Offstage(
              offstage: isThisAuthorized('theTaskAction'),
              child: PopupMenuButton(
                child: Text('Projects'),
                itemBuilder: (BuildContext bc) => [
                  PopupMenuItem(
                    enabled: !isThisAuthorized('theTaskAction'),
                    child: Text("Syncable SQL"),
                    value: 'sqlpage',
                  ),
                  PopupMenuItem(
                    child: Text("Item 2"),
                  ),
                  PopupMenuItem(
                    child: Text("Item 3"),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'sqlpage')
                    setState(() {
                      if (!data.contains('Syncable SQL')) {
                        data.add('Syncable SQL');
                        _selectedtab = 1;
                        initPosition = data.length - 1;
                      }
                    });
                },
              ),
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Staff'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(child: Text("Item 1")),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (route) {},
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Stock Control'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(child: Text("Item 1")),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (route) {},
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Cable Drums'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  enabled: !isThisAuthorized('theTaskAction'),
                  child: Text("Cable Drums"),
                  value: 'cabledrums',
                ),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ], //comment
              onSelected: (value) {
                if (value == 'cabledrums')
                  setState(() {
                    if (!data.contains('Cable Drums')) {
                      data.add('Cable Drums');
                      _selectedtab = 1;
                      initPosition = data.length - 1;

                      // DefaultTabController.of(context)
                      //     .animateTo(data.length - 1);
                    }
                  });
              },
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Cable Process'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Text("Initiate Process"),
                  value: 'initiateProcess',
                ),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (value) {
                if (value == 'initiateProcess')
                  setState(() {
                    if (!data.contains('Initiate Process')) {
                      data.add('Initiate Process');
                      _selectedtab = 1;
                      initPosition = data.length - 1;
                      // DefaultTabController.of(context)
                      //     .animateTo(data.length - 1);
                    }
                  });
              },
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Site Administration'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Text("Item 1"),
                ),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (route) {},
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('CMS Administration'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Text("Item 1"),
                ),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (route) {},
            ),
            Container(
              width: 10,
            ),
            PopupMenuButton(
              child: Text('Help'),
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Text("Item 1"),
                ),
                PopupMenuItem(
                  child: Text("Item 2"),
                ),
                PopupMenuItem(
                  child: Text("Item 3"),
                ),
              ],
              onSelected: (route) {},
            )
          ],
        ),
      ),
      //     persistentFooterButtons: <Widget>[
      // Icon(Icons.email),
      // Icon(Icons.remove)
// ],

      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.blue,
        //   ),
        //   // borderRadius: BorderRadius.circular(10.0),
        // ),
        child: CustomTabView(
          initPosition: initPosition,
          itemCount: data.length,
          tabBuilder: (context, index) => Tab(
              child: GestureDetector(
            child: Text(data[index]),
            onDoubleTap: () {
              setState(() {
                data.remove(data[index]);
              });
            },
          )),
          pageBuilder: (context, index) => selectPage(
              data[index]), //function call to select tab depending on index
          onPositionChange: (index) {
            initPosition = index;
          },
        ),
      ),

      bottomNavigationBar: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                // borderRadius: BorderRadius.circular(10.0),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: new ListView.builder(
                  itemCount: bottomNote.litems.length,
                  itemExtent: 20,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(title: new Text( bottomNote.litems[index], style: TextStyle(fontSize: 12, color: bottomNote.colorCodes[index] )));
                  }),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  bottomNote.clear();
                },
                child: Text('Clear')),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget selectPage(String pageName) {
    switch (pageName) {
      case 'Cable Drums':
        return CableDrums();
        break;

      case 'Syncable SQL':
        return SQLPage();
        break;

      case 'Initiate Process':
        return InitiateProcess();
        break;

      default:
        return Container();
    }
  }
}
