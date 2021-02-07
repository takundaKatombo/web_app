import 'package:flutter/material.dart';
import 'package:web_app/views/pages/sqlpage.dart';
import 'package:web_app/views/widgets/tabview.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = ['Welcome Page'];
    int initPosition = 1; String dropdownValue = 'One';

  var _selectedtab=0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Row(children: [PopupMenuButton(child: Text('Menu item 1'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Syncable SQL"),value: 'sqlpage',),
              PopupMenuItem(
                  child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (value) {
               if(value=='sqlpage')setState(() {
              if(!data.contains('Syncable SQL')){data.add('Syncable SQL');_selectedtab = 1;}
            });
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 2'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1")),
              PopupMenuItem(
                  child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 3'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1")),
              PopupMenuItem(
                  child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 4'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"),),
              PopupMenuItem(
                  child: Text("Item 2"),),
              PopupMenuItem(child: Text("Item 3"),),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 5'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"),),
              PopupMenuItem(
                  child: Text("Item 2"),),
              PopupMenuItem(child: Text("Item 3"),),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,), PopupMenuButton(child: Text('Menu item 6'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"), ),
              PopupMenuItem(
                  child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          )],),
      ),persistentFooterButtons: <Widget>[
  Icon(Icons.email),
  Icon(Icons.remove)
], body: CustomTabView( 
  initPosition: initPosition,
  itemCount: data.length,
  tabBuilder: (context, index) => Tab(text: data[index]),
  pageBuilder: (context, index) => _selectedtab==0 ?Center(child: Text(data[index])):SQLPage(),
  onPositionChange: (index){
    print('current position: $index');
    initPosition = index;
  },
  onScroll: (position) => print('$position'),
),   );
  }
}

