import 'package:flutter/material.dart';

class SQLPage extends StatelessWidget {
  const SQLPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Please Enter The Sql Below')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Title Label')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Text Here')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Title Label ')),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child:Center(child: Row(children: [Text('Title Label'),Container(width:MediaQuery.of(context).size.width*0.7,child: TextField(),decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),)],)),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Row(children: [Text('Title Label'),Container(width:MediaQuery.of(context).size.width*0.7,
        child: TextField(),decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
      )],)),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child:Center(child: Container(height:MediaQuery.of(context).size.height*0.2,decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),)),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(onPressed: (){}, child: Text('Execute')),
    ),Spacer(),Container()],);
  }
}
