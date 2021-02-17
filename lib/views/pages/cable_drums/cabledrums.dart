import 'dart:ui';

import 'package:flutter/material.dart';

class CableDrums extends StatefulWidget {
  @override
  _CableDrumsState createState() => _CableDrumsState();
}

class _CableDrumsState extends State<CableDrums> {
  List<bool> isSelected = [false, false];
  String screen = 'none';

  var searchBy;
  var value = false;

  bool _emptyDrumsCB = false;
  bool _incompleteDrumsCB = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.black, width: 1.0),
                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                // ),
                child: Center(
                  child: Card(
                    elevation: 5,
                    child: ToggleButtons(
                      selectedColor: Colors.white,
                      // borderRadius: BorderRadius.circular(5),
                      // borderColor: Colors.blue,
                      fillColor: Colors.blue,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          //onPressed: () {  },
                          child: Center(
                            child: Text(
                              'List',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          // onPressed: () {  },
                          child: Center(
                            child: Text(
                              'Update',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] =
                                  !isSelected[buttonIndex];
                            } else {
                              isSelected[buttonIndex] = false;
                            }
                          }
                          if (index == 0 && screen != 'list')
                            setScreen('list');
                          else if (index == 1 && screen != 'update')
                            setScreen('update');
                          else if ((index == 0 && screen == 'list') ||
                              (index == 1 && screen == 'update'))
                            setScreen('none');
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ),
                )),
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: chooseScreen(screen),
            ),
          ],
        ),
      ),
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
                child: Card(
              elevation: 10,
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
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: new DropdownButton<String>(
                        value: 'Choose ...',
                        items: <String>['Choose ...', 'A', 'B', 'C', 'D']
                            .map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4.0),
                  //   child: Text('Empty Drums'),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: CheckboxListTile(
                      title: const Text('Empty Drums'),
                      onChanged: (bool value) {
                        setState(() {
                          _emptyDrumsCB = !_emptyDrumsCB;
                        });
                      },
                      value: _emptyDrumsCB,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: CheckboxListTile(
                      title: const Text('Incomplete Drums'),
                      onChanged: (bool value) {
                        setState(() {
                          _incompleteDrumsCB = value;
                        });
                      },
                      value: _incompleteDrumsCB,
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
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
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
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.13,
                child: Card(
                  elevation: 10,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Search By Drum Number(uses site options)'),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Drum Number'),
                      ),
                      Container(
                          child: TextField(),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.06),
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
            ),
            Visibility(
                visible: searchBy == 'cable',
                child: Container(
                  child: Card(
                    elevation: 10,
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
                                  // borderRadius: BorderRadius.circular(10.0),

                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: TextField(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                    child: Text('Search'),
                                    onPressed: onpressed),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(),
                    ]),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                )),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: DataTable(
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(label: Text('Site')),
                          DataColumn(label: Text('Product')),
                          DataColumn(label: Text('Cable Code')),
                          DataColumn(label: Text('E')),
                          DataColumn(label: Text('Drum Number'))
                        ],
                        rows: [
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                          DataRow(
                              onSelectChanged: (selected) {
                                setState(() {
                                  setScreen('update');
                                  isSelected = [false, true];
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 last item ')),
                              ]),
                        ],
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    // borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Search'),
                      Container(
                        width: 15,
                      ),
                      Container(
                        child: TextField(),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Container(
                        width: 15,
                      ),
                      ElevatedButton(onPressed: null, child: Text('Label')),
                      Container(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: onPressed, child: Text('Fields')),
                      Container(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: onPressed, child: Text('Update')),
                      Container(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: onPressed, child: Text('CSV Export')),
                      Container(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: onPressed, child: Text('PDF Export')),
                      Container(
                        width: 15,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: CheckboxListTile(
                          value: value,
                          onChanged: onChanged,
                          title: Text('Non-active'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 15,
            )
          ],
        );
      case 'update':
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Card(
            elevation: 5,
            child: Column(
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
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              child: Text('Supplier cable drum no.'),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                          Container(
                            child: TextField(),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.close),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Drum Number'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(),
                                )
                              ]),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Electric Speed'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
            ),
          ),
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
