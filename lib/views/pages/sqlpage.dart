import 'package:flutter/material.dart';

class SQLPage extends StatefulWidget {
  const SQLPage({
    Key key,
  }) : super(key: key);

  @override
  _SQLPageState createState() => _SQLPageState();
}

class _SQLPageState extends State<SQLPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Please Enter The Sql Below')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Tips')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Text Here')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Examples ')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child:Center(child: Row(children: [Text('General Update'),Container(width:MediaQuery.of(context).size.width*0.7,child: Text('Sample Query'),decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
    ),)],)),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Row(children: [Text('General Update'),Container(width:MediaQuery.of(context).size.width*0.7,
        child: Text('Sample Text '),decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
    ),
      ),],),),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child:Center(child: Container(child:Text('Results Here'),height:MediaQuery.of(context).size.height*0.2,width:MediaQuery.of(context).size.width*0.8,decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      // borderRadius: BorderRadius.circular(10.0),
    ),)),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){setState((){});}, child: Text('Execute')),
    ),Spacer(),Container()],);
  }
}
