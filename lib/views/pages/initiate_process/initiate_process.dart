import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_app/Model/mock_data/dataTable.dart';
import 'package:web_app/views/pages/initiate_process/drop_down_model.dart';

class InitiateProcess extends StatefulWidget {
  @override
  _InitiateProcessState createState() => _InitiateProcessState();
}

class _InitiateProcessState extends State<InitiateProcess> {
  List<String> _site = ["Choose a site"];
  List<String> _subProjects = ["Choose Sub Project"];
  List<String> _schedule = ["Choose Schedule"];
  List<String> _mainProjects = ["Choose Main Project"];
  String _selectedSite = "Choose a site";
  String _selectedMainProject = "Choose Main Project";
  String _selectedSchedule = "Choose Schedule";
  String _selectedSubProjects = "Choose Sub Project";

  bool _isChecked = false;

  bool scheduledd = false;
  bool systemdd = false;

  bool _isCheckedTransmitalcode1 = false;

  bool _isCheckedGreen1 = false;
  bool _blueGrey1 = false;
  bool _pink1 = false;
  bool _isCheckedRed1 = false;
  bool _isCheckedTransmitalcode2 = false;

  bool _isCheckedGreen2 = false;
  bool _blueGrey2 = false;
  bool _pink2 = false;
  bool _isCheckedRed2 = false;
  bool _isCheckedTransmitalcode3 = false;

  bool _isCheckedGreen3 = false;
  bool _blueGrey3 = false;
  bool _pink3 = false;
  bool _isCheckedRed3 = false;

  bool _isCheckedGreen4 = false;
  bool _isCheckedTransmitalcode4 = false;

  bool _blueGrey4 = false;
  bool _pink4 = false;
  bool _isCheckedRed4 = false;

  bool _isCheckedGreen5 = false;
  bool _isCheckedTransmitalcode5 = false;

  bool _blueGrey5 = false;
  bool _pink5 = false;
  bool _isCheckedRed5 = false;

  bool _source = false, _dest = false, _source1 = false, _dest1 = false;

  bool _transmitalnoteLast = false, _qcsheet = false, _mergersheet = false;

  List<String> rows = ['init'];
  @override
  void initState() {
    super.initState();
    _site = getSites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _site.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) => _onSelectedSite(value),
                        value: _selectedSite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _mainProjects.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) => _onSelectedMainProject(value),
                        value: _selectedMainProject,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _subProjects.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) => _onSelectedSubProject(value),
                        value: _selectedSubProjects,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _schedule.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        // onChanged: (value) => print(value),
                        onChanged: (value) => _onSelectedSchedule(value),
                        value: _selectedSchedule,
                      ),
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('version'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.04,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: TextField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Reload'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: scheduledd,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('System'),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: new DropdownButton<String>(
                                value: 'Choose ...',
                                items: <String>[
                                  'Choose ...',
                                  'BFA',
                                  'BFC',
                                  'BDC'
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {
                                  setState(() {
                                    systemdd = !systemdd;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Cable Number'),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Go'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Select the file'),
                          ElevatedButton(
                              onPressed: onPressed, child: Text('Browse'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: systemdd,
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Pull Slip')),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Transmital Note',
                                              style: TextStyle(fontSize: 12)),
                                          value: _isCheckedTransmitalcode1,
                                          onChanged: (val) {
                                            setState(() {
                                              _isCheckedTransmitalcode1 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.green),
                                          child: Checkbox(
                                              activeColor: Colors.green,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedGreen1,
                                              onChanged: (val) {
                                                setState(() {
                                                  setState(() {
                                                    _isCheckedGreen1 = val;
                                                  });
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.red),
                                          child: Checkbox(
                                              activeColor: Colors.red,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedRed1,
                                              onChanged: (val) {
                                                setState(() {
                                                  _isCheckedRed1 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.blueGrey),
                                          child: Checkbox(
                                              activeColor: Colors.blueGrey,
                                              //title: Text('Transmital Note'),
                                              value: _blueGrey1,
                                              onChanged: (val) {
                                                setState(() {
                                                  _blueGrey1 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.pink),
                                          child: Checkbox(
                                              activeColor: Colors.pink,
                                              //title: Text('Transmital Note'),
                                              value: _pink1,
                                              onChanged: (val) {
                                                setState(() {
                                                  _pink1 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Term Slip')),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Transmital Note',
                                              style: TextStyle(fontSize: 12)),
                                          value: _isCheckedTransmitalcode2,
                                          onChanged: (val) {
                                            setState(() {
                                              _isCheckedTransmitalcode2 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Source',
                                              style: TextStyle(fontSize: 12)),
                                          value: _source,
                                          onChanged: (val) {
                                            setState(() {
                                              _source = val;
                                            });
                                          }),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Dest',
                                              style: TextStyle(fontSize: 12)),
                                          value: _dest,
                                          onChanged: (val) {
                                            setState(() {
                                              _dest = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.green),
                                          child: Checkbox(
                                              activeColor: Colors.green,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedGreen2,
                                              onChanged: (val) {
                                                setState(() {
                                                  setState(() {
                                                    _isCheckedGreen2 = val;
                                                  });
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.red),
                                          child: Checkbox(
                                              activeColor: Colors.red,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedRed2,
                                              onChanged: (val) {
                                                setState(() {
                                                  _isCheckedRed2 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.blueGrey),
                                          child: Checkbox(
                                              activeColor: Colors.blueGrey,
                                              //title: Text('Transmital Note'),
                                              value: _blueGrey2,
                                              onChanged: (val) {
                                                setState(() {
                                                  _blueGrey2 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.pink),
                                          child: Checkbox(
                                              activeColor: Colors.pink,
                                              //title: Text('Transmital Note'),
                                              value: _pink2,
                                              onChanged: (val) {
                                                setState(() {
                                                  _pink2 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Joints Slip')),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Transmital Note',
                                              style: TextStyle(fontSize: 12)),
                                          value: _isCheckedTransmitalcode3,
                                          onChanged: (val) {
                                            setState(() {
                                              _isCheckedTransmitalcode3 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Source',
                                              style: TextStyle(fontSize: 12)),
                                          value: _source1,
                                          onChanged: (val) {
                                            setState(() {
                                              _source1 = val;
                                            });
                                          }),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Dest',
                                              style: TextStyle(fontSize: 12)),
                                          value: _dest1,
                                          onChanged: (val) {
                                            setState(() {
                                              _dest1 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.green),
                                          child: Checkbox(
                                              activeColor: Colors.green,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedGreen3,
                                              onChanged: (val) {
                                                setState(() {
                                                  setState(() {
                                                    _isCheckedGreen3 = val;
                                                  });
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.red),
                                          child: Checkbox(
                                              activeColor: Colors.red,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedRed3,
                                              onChanged: (val) {
                                                setState(() {
                                                  _isCheckedRed3 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.blueGrey),
                                          child: Checkbox(
                                              activeColor: Colors.blueGrey,
                                              //title: Text('Transmital Note'),
                                              value: _blueGrey3,
                                              onChanged: (val) {
                                                setState(() {
                                                  _blueGrey3 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.pink),
                                          child: Checkbox(
                                              activeColor: Colors.pink,
                                              //title: Text('Transmital Note'),
                                              value: _pink3,
                                              onChanged: (val) {
                                                setState(() {
                                                  _pink3 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Removal')),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Transmital Note',
                                              style: TextStyle(fontSize: 12)),
                                          value: _isCheckedTransmitalcode4,
                                          onChanged: (val) {
                                            setState(() {
                                              _isCheckedTransmitalcode4 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.green),
                                          child: Checkbox(
                                              activeColor: Colors.green,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedGreen4,
                                              onChanged: (val) {
                                                setState(() {
                                                  setState(() {
                                                    _isCheckedGreen4 = val;
                                                  });
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.red),
                                          child: Checkbox(
                                              activeColor: Colors.red,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedRed4,
                                              onChanged: (val) {
                                                setState(() {
                                                  _isCheckedRed4 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.blueGrey),
                                          child: Checkbox(
                                              activeColor: Colors.blueGrey,
                                              //title: Text('Transmital Note'),
                                              value: _blueGrey4,
                                              onChanged: (val) {
                                                setState(() {
                                                  _blueGrey4 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.pink),
                                          child: Checkbox(
                                              activeColor: Colors.pink,
                                              //title: Text('Transmital Note'),
                                              value: _pink4,
                                              onChanged: (val) {
                                                setState(() {
                                                  _pink4 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Disconnect ')),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CheckboxListTile(
                                          title: Text('Transmital Note',
                                              style: TextStyle(fontSize: 12)),
                                          value: _isCheckedTransmitalcode5,
                                          onChanged: (val) {
                                            setState(() {
                                              _isCheckedTransmitalcode5 = val;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.green),
                                          child: Checkbox(
                                              activeColor: Colors.green,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedGreen5,
                                              onChanged: (val) {
                                                setState(() {
                                                  setState(() {
                                                    _isCheckedGreen5 = val;
                                                  });
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.red),
                                          child: Checkbox(
                                              activeColor: Colors.red,
                                              //title: Text('Transmital Note'),
                                              value: _isCheckedRed5,
                                              onChanged: (val) {
                                                setState(() {
                                                  _isCheckedRed5 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.blueGrey),
                                          child: Checkbox(
                                              activeColor: Colors.blueGrey,
                                              //title: Text('Transmital Note'),
                                              value: _blueGrey5,
                                              onChanged: (val) {
                                                setState(() {
                                                  _blueGrey5 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.pink),
                                          child: Checkbox(
                                              activeColor: Colors.pink,
                                              //title: Text('Transmital Note'),
                                              value: _pink5,
                                              onChanged: (val) {
                                                setState(() {
                                                  _pink5 = val;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print QC Sheet')),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note',
                                          style: TextStyle(fontSize: 12)),
                                      value: _transmitalnoteLast,
                                      onChanged: (val) {
                                        setState(() {
                                          _transmitalnoteLast = val;
                                        });
                                      }),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: CheckboxListTile(
                                      title: Text('QC Sheet',
                                          style: TextStyle(fontSize: 12)),
                                      value: _qcsheet,
                                      onChanged: (val) {
                                        setState(() {
                                          _qcsheet = val;
                                        });
                                      }),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: CheckboxListTile(
                                      title: Text('Merger Sheet',
                                          style: TextStyle(fontSize: 12)),
                                      value: _mergersheet,
                                      onChanged: (val) {
                                        setState(() {
                                          _mergersheet = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Card(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text('Print Merger Sheet')),
                                new DropdownButton<String>(
                                  value: 'Choose ...',
                                  items: <String>[
                                    'Choose ...',
                                    'Opt 1',
                                    'Opt 2',
                                    'Opt 3'
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    setState(() {
                                      systemdd = !systemdd;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Center(
                            child: ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Drawings')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                        child: DataTable(
                      showCheckboxColumn: true,
                      columnSpacing: 20,
                      columns: [
                        DataColumn(
                          label: Text("Site "),
                          numeric: false,
                          tooltip: "",
                        ),
                        DataColumn(
                          label: Text("Product"),
                          numeric: false,
                          tooltip: "",
                        ),
                        DataColumn(
                          label: Text("Type"),
                          numeric: false,
                          tooltip: "",
                        ),
                        DataColumn(
                          label: Text("Drum"),
                          numeric: false,
                          tooltip: "",
                        ),
                      ],
                      rows: DataTableRepo()
                          .getAll()
                          .map(
                            (equipeDetail) => DataRow(
                                selected: rows != null
                                    ? rows.contains(
                                        equipeDetail['Product'].toString())
                                    : false,
                                onSelectChanged: (bool selected) {
                                  print(rows);
                                  setState(() {
                                    if (selected) {
                                      rows.add(
                                          equipeDetail['Product'].toString());
                                    } else {
                                      rows.remove(
                                          equipeDetail['Product'].toString());
                                    }
                                  });
                                },
                                cells: [
                                  DataCell(
                                    Text(equipeDetail['Site'].toString()),
                                  ),
                                  DataCell(
                                    Text(equipeDetail['Product'].toString()),
                                  ),
                                  DataCell(
                                    Text(equipeDetail['type'].toString()),
                                  ),
                                  DataCell(
                                    Text(equipeDetail['Drum'].toString()),
                                  ),
                                ]),
                          )
                          .toList(),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectedMainProject(String value) {
    setState(() {
      _selectedMainProject = value;
      _subProjects = getSubProject(_selectedMainProject);
    });
  }

  void _onSelectedSite(String value) {
    setState(() {
      _selectedSite = value;
      _mainProjects = getProjects(_selectedSite);
    });
  }

  void onPressed() {}

  _onSelectedSchedule(String value) {
    setState(() {
      _selectedSchedule = value;
      scheduledd = !scheduledd;
      if (systemdd) {
        systemdd = !systemdd;
      }
    });
  }

  _onSelectedSubProject(String value) {
    setState(() {
      _selectedSubProjects = value;
      _schedule = getSchedule(_selectedSubProjects);
    });
  }

  List<String> getSchedule(String subProject) {
    if (subProject != "Choose Sub Project")
      return [
        "Choose Schedule",
        "Schedule 1",
        "Schedule 2",
        "Schedule 3",
        "Schedule 4",
        "Schedule 5",
      ];
    else
      return null;
  }

  List<String> getSubProject(String project) {
    if (project != "Choose Project")
      return [
        "Choose Sub Project",
        "Sub Project 1",
        "Sub Project 2",
        "Sub Project 3",
        "Sub Project 4",
        "Sub Project 5",
      ];
    else
      return null;
  }

  List<String> getProjects(String site) {
    if (site != "Choose Site")
      return [
        "Choose Main Project",
        "Main Project 1",
        "Main Project 2",
        "Main Project 3",
        "Main Project 4",
        "Main Project 5",
      ];
    else
      return null;
  }

  List<String> getSites() =>
      ["Choose a site", "Site 1", "Site 2", "Site 3", "Site 4", "Site 5"];

  onSelectedRow(bool selected, String row) {}
}
