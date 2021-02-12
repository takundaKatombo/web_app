import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/page_controllers/cabledrums.dart';

class CableDrums extends StatefulWidget {
  @override
  _CableDrumsState createState() => _CableDrumsState();
}

enum Refetch { yes, no }

class _CableDrumsState extends State<CableDrums> {
  List<bool> isSelected = [false, false];
  String screen = 'none';
  Refetch _character = Refetch.no;

  var searchBy;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Center(
                child: ToggleButtons(
                  borderColor: Colors.blue,
                  hoverColor: Colors.lightBlue,
                  selectedBorderColor: Colors.blue,
                  selectedColor: Colors.blue,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'List',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      if (index == 0 && screen != 'list')
                        setScreen('list');
                      else if (index == 1 && screen != 'update')
                        setScreen('update');
                      else if ((index == 0 && screen == 'list') ||
                          (index == 1 && screen == 'update')) setScreen('none');
                    });
                  },
                  isSelected: isSelected,
                ),
              )),
        ),
        Container(
          child: chooseScreen(screen),
        ),
        Spacer(),
        Container()
      ],
    );
  }

  Widget chooseScreen(String screen) {
    switch (screen) {
      case 'list':
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('List Cable Drums'),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Refresh')),
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Container(
              child: Row(children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Site Filter Options'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Site Filter'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Select Site'),
                      ),
                    ]),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: new DropdownButton<String>(
                      value: 'Site',
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Empty Drums'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: ListTile(
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Re Fetch'),
                  ),
                ),
              ]),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                // borderRadius: BorderRadius.circular(10.0),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
            )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (searchBy != 'cable')
                                searchBy = 'cable';
                              else
                                searchBy = null;
                            });
                          },
                          child: Text('Toggle Search By Cable Type'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (searchBy != 'drum')
                                searchBy = 'drum';
                              else
                                searchBy = null;
                            });
                          },
                          child: Text('Toggle Search By Drum Number'),
                        ),
                      )
                    ],
                  )),
            ),
            Visibility(
              visible: searchBy == 'drum',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  // borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Search By Drum Number(uses site options)'),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Drum Number'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.06),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        child: Text('Search'),
                        onPressed: onpressed,
                      ),
                    )
                  ])
                ]),
              ),
            ),
            Visibility(
                visible: searchBy == 'cable',
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    // borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              'Search Drums By Cable Type(uses site filter)'),
                        ),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Filter'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'OFF',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: onpressed,
                              child: Text('Close'),
                            ),
                          )
                        ]),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Product Name'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  // borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.of(context).size.width * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextField(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  child: Text('Search'), onPressed: onpressed),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(),
                  ]),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.25,
                )),
          ],
        );
      case 'update':
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Update a cable drum'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        child: Text('Supplier cable drum no.'),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          // borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          child: TextField(),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.blue),
                    bottom: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  // borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Drum Number'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Product on Drum'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Supplier Drum no.'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Manu Batch no.'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Drum Type'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Drum Empty'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Quantity in stock'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Electric Speed'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Meters measured  (Actual)'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Meters Received'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Supplier'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Recieved Date'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Delivery Note no.'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Comments'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(),
                        )
                      ]),
                ),
              ])
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: onPressed, child: Text('Submit')),
                Container(width: 20),
                ElevatedButton(onPressed: onPressed, child: Text('Clear'))
              ],
            )
          ],
        );

        break;
      default:
        return Container();
    }
  }

  void onChanged(bool value) {}

  void setScreen(String screenName) {
    screen = screenName;
  }

  void onpressed() {}

  void onPressed() {}
}
