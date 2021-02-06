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
    int initPosition = 1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.white,backgroundColor:Colors.white,
       
        title: Row(children: [TextButton(onPressed: () {  setState(() {
              data.add('Syncable SQL');
            }); }, child: Text('Synchable SQL'),),Container(width: 10,),TextButton(onPressed: () {  }, child: Text('Menu Item 2'),),Container(width: 10,),TextButton(onPressed: () {  }, child: Text('Menu Item 3'),),Container(width: 10,),TextButton(onPressed: () {  }, child: Text('Menu Item 4'),),Container(width: 10,),TextButton(onPressed: () {  }, child: Text('Menu Item 5'),),Container(width: 10,),TextButton(onPressed: () {  }, child: Text('Menu Item 6'),)],),
      ),persistentFooterButtons: <Widget>[
  Icon(Icons.email),
  Icon(Icons.more_horiz)
], body: CustomTabView( 
  initPosition: initPosition,
  itemCount: data.length,
  tabBuilder: (context, index) => Tab(text: data[index]),
  pageBuilder: (context, index) => index==0 ?Center(child: Text(data[index])):SQLPage(),
  onPositionChange: (index){
    print('current position: $index');
    initPosition = index;
  },
  onScroll: (position) => print('$position'),
),   );
  }
}

