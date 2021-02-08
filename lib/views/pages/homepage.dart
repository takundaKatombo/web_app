import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
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
    var litems = Provider.of<BottomNotifications>(context);
    return Scaffold(
      appBar: AppBar(
       
        title: Row(children: [PopupMenuButton(child: Text('Menu item 1'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Syncable SQL"),value: 'sqlpage',),
              PopupMenuItem(child: Text("Item 2"), ),
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
              PopupMenuItem(child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 3'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1")),
              PopupMenuItem(child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 4'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"),),
              PopupMenuItem(child: Text("Item 2"),),
              PopupMenuItem(child: Text("Item 3"),),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,),PopupMenuButton(child: Text('Menu item 5'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"),),
              PopupMenuItem(child: Text("Item 2"),),
              PopupMenuItem(child: Text("Item 3"),),
            ],
            onSelected: (route) {
              
            },
          ),Container(width: 10,), PopupMenuButton(child: Text('Menu item 6'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("Item 1"), ),
              PopupMenuItem(child: Text("Item 2"), ),
              PopupMenuItem(child: Text("Item 3"), ),
            ],
            onSelected: (route) {
              
            },
          )],),
      ),
  //     persistentFooterButtons: <Widget>[
  // Icon(Icons.email),
  // Icon(Icons.remove)
// ],

 body:
     CustomTabView( 
      initPosition: initPosition,
      itemCount: data.length,
      tabBuilder: (context, index) => Tab(child: GestureDetector(child: Text( data[index]),onDoubleTap: (){setState(() {
        data.remove( data[index]);index==1?_selectedtab=1:_selectedtab=0;
      });},)),
      pageBuilder: (context, index) => _selectedtab==0 ?Container():SQLPage(),
      onPositionChange: (index){
       setState(() {
         index==0?_selectedtab=0:_selectedtab=1;
       });
        initPosition = index;
      },
      onScroll: (position) => print('$position'),
 ),

    
  // footer: new Footer(
  //         child: Padding(
  //           padding: new EdgeInsets.all(10.0),
  //           child:Container( color:Colors.black,child: new ListView.builder
            
  //             (
            
  //               itemCount: litems.length,
            
  //               itemBuilder: (BuildContext ctxt, int index) {
            
  //                return new Text(litems[index]);
            
  //               }
            
  //             ),),
  //         ),
  //       ),
       // flex: 1, //default flex is 2
     // ),
     bottomNavigationBar: Container(decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
    ),
       child: Row(
         children: [
           Container(decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
    ), height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.8,child: new ListView.builder
                  
                    (
                  
                      itemCount: litems.litems.length,
                  
                      itemBuilder: (BuildContext ctxt, int index) {
                  
                       return new Text(litems.litems[index]);
                  
                      }
                  
                    ),),ElevatedButton(onPressed:  (){litems.clear();}, child: Text('Clear'))
         ],
       ),
     ),
          
    );
  }
}

