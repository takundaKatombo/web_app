import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/page_controllers/cabledrums.dart';

class CableDrums extends StatefulWidget{
  @override
  _CableDrumsState createState() => _CableDrumsState();
}
enum Refetch { yes, no }
class _CableDrumsState extends State<CableDrums> {

  List<bool> isSelected = [false, false];  String screen = 'none';
  Refetch _character = Refetch.no;


  var searchBy;

  @override
  Widget build(BuildContext context) { 
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
    Container(height:MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.3 ,child: Center(child: ToggleButtons(
            borderColor: Colors.blue,
            hoverColor: Colors.lightBlue,
            selectedBorderColor: Colors.blue,
            selectedColor: Colors.blue,
            children: <Widget>[
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: MediaQuery.of(context).size.width*0.15,
                  child: Text(
                      'List',
                      style: TextStyle(fontSize: 16),
                  ),
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: MediaQuery.of(context).size.width*0.15,
                  child: Text(
                      'Update',
                      style: TextStyle(fontSize: 16),
                  ),
                ),
                ),
            ],
            onPressed: (int index) {setState(() {
                                 if(index==0&&screen!='list')setScreen('list');else if(index==1&&screen!='update')setScreen('update');else if((index==0&&screen=='list')||(index==1&&screen=='update')) setScreen('none');

            });
            },
            isSelected: isSelected,
            ),)),Container(child: chooseScreen(screen),),Spacer(),Container()
        ],
      );
    
    
    
  }

  Widget chooseScreen(String screen){
    switch (screen) {
      case 'list':return Column(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(width: MediaQuery.of(context).size.width*0.4,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Text('List Cable Drums'),Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {  },
        child:Text('Refresh')),
      )
            ],
          ),
        ),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child:Container(child:Row(children:[Column(children:[Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Site Filter Options'),
        ),Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children:[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Site Filter'),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select Site'),
          ),]),
        )]),Padding(
          padding: const EdgeInsets.all(8.0),
          child: new DropdownButton<String>(value:'Site' ,
  items: <String>['A', 'B', 'C', 'D'].map((String value) {
    return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
    );
  }).toList(),
  onChanged: (_) {},
),
        ),Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text('Empty Drums'),
), Container(width: MediaQuery.of(context).size.width*0.15,
  child:   ListTile(  
      title: const Text('Yes'),
  
      leading: Radio(
  
        value: Refetch.yes,
  
        groupValue: _character,
  
        onChanged: (Refetch value) {
  
          setState(() {
  
            _character = value;
  
          });
  
        },
  
      ),
  
            ),
),
          Container(width: MediaQuery.of(context).size.width*0.15,
            child: ListTile(
      title: const Text('No'),
      leading: Radio(
        value: Refetch.no,
        groupValue: _character,
        onChanged: (Refetch value) {
          setState(() {
            _character = value;
          });
        },
      ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {  },
            child: Text('Re Fetch'),),
          ),
]),decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        // borderRadius: BorderRadius.circular(10.0),
    ),width:MediaQuery.of(context).size.width*0.7,height:MediaQuery.of(context).size.height*0.1,)),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(width:MediaQuery.of(context).size.width*0.6,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () { setState(() {
            if(searchBy!='cable')searchBy='cable';else searchBy=null;
          }); },
          child: Text('Toggle Search By Cable Type'),),
        ),Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {setState(() {
            if(searchBy!='drum')searchBy='drum';else searchBy=null;
          }); },
          child: Text('Toggle Search By Drum Number'),),
        )],)),
    ),Visibility(visible: searchBy=='drum',child:Container(decoration: BoxDecoration(
            border: Border.all(
      color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10.0),
          ),width:MediaQuery.of(context).size.width*0.5,height:MediaQuery.of(context).size.height*0.2,child:Column(children:[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Search By Drum Number(uses site options)'),
          ),Row(children:[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Drum Number'),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
            ),child:TextField(),width:MediaQuery.of(context).size.width*0.1,height:MediaQuery.of(context).size.height*0.06),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(child:Text('Search'),onPressed: onpressed,),
          )])]),) ,),Visibility(visible:searchBy=='cable',child:Container(decoration: BoxDecoration(
            border: Border.all(
      color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10.0),
          ),child:Row(children:[Column(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Search Drums By Cable Type(uses site filter)'),
    ),Row(children:[Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Filter'),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('OFF',style: TextStyle(color:Colors.green),),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: onpressed,child: Text('Close'),),
    )]),Row(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Product Name'),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
            ),width:MediaQuery.of(context).size.width*0.1,height:MediaQuery.of(context).size.height*0.07,child: TextField(),),
    ),Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(child:Text('Search'),onPressed:onpressed),
    )],)],),Column(),]),width:MediaQuery.of(context).size.width*0.6,height:MediaQuery.of(context).size.height*0.25,)),Padding(
            padding: const EdgeInsets.all(8.0),
            child:Center(child: Container(child:Text('DataGrid Here'),height:MediaQuery.of(context).size.height*0.2,width:MediaQuery.of(context).size.width*0.8,decoration: BoxDecoration(
            border: Border.all(
      color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10.0),
          ),)),
          ),],);
            case 'update': return ListView(children:[Row(children:[Column(children: [Row(children:[Text('Drum Number'),Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)]),Row(children:[Text('Product on Drum'),Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)]),Row(children:[Text('Supplier Drum No'),Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)],),Row(children:[Text('Manu Batch No'),Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)]),Row(children:[Text('Drum Type'),/*drop down menu*/Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)]),Row(children:[Text('Drum Empty'),Container(decoration: BoxDecoration(
          border: Border.all(
                color: Colors.blue,
          ),
          // borderRadius: BorderRadius.circular(10.0),
        ),child: TextField(),)]),])])]);
            
            
    //         Column(children: [Text('Update A Cable Drum'),Row(mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text('Search Cable Drum Number'),
    //               ),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //           color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(decoration: BoxDecoration(
    //   border: Border.all(
    //     color: Colors.blue,
    //   ),
    //   // borderRadius: BorderRadius.circular(10.0),
    // ),width:MediaQuery.of(context).size.width*0.1,height:MediaQuery.of(context).size.height*0.1,child: TextField()),
    //                 ),
    //               ),
    //             ],
    //           ),Row(children:[Column(children: [Row(children:[Text('Drum Number'),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)]),Row(children:[Text('Product on Drum'),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)]),Row(children:[Text('Supplier Drum No'),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)],),Row(children:[Text('Manu Batch No'),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)]),Row(children:[Text('Drum Type'),/*drop down menu*/Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)]),Row(children:[Text('Drum Empty'),Container(decoration: BoxDecoration(
    //       border: Border.all(
    //             color: Colors.blue,
    //       ),
    //       // borderRadius: BorderRadius.circular(10.0),
    //     ),child: TextField(),)]),],mainAxisAlignment: MainAxisAlignment.center,)]),],mainAxisAlignment: MainAxisAlignment.center,);
            break;
          default:return Container();
        }
      }
    
      void onChanged(bool value) {
      }
    
      void setScreen(String screenName)
      {
        screen = screenName;
      }
    
      void onpressed() {
  }
}
 