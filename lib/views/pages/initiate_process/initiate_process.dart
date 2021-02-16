import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_app/views/pages/initiate_process/drop_down_model.dart';

class InitiateProcess extends StatefulWidget {
  @override
  _InitiateProcessState createState() => _InitiateProcessState();
}

class _InitiateProcessState extends State<InitiateProcess> {
  Repository repo = Repository();

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

  @override
  void initState() {
    _site = List.from(_site)..addAll(repo.getSites());
    super.initState();
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
                            onPressed: () {
                              setState(() {
                                scheduledd = !scheduledd;
                                if (systemdd) {
                                  systemdd = !systemdd;
                                }
                              });
                            },
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
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: new DropdownButton<String>(
                                value: 'BFA',
                                items: <String>['BFA', 'BFC', 'BDC']
                                    .map((String value) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Pull Slip')),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note'),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.red,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.amber,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.green,
                                        //title: Text('Transmital Note'),
                                        value: true,
                                        onChanged: (val) {
                                          setState(() {});
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Pull Slip')),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note'),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.red,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.amber,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.green,
                                        //title: Text('Transmital Note'),
                                        value: true,
                                        onChanged: (val) {
                                          setState(() {});
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Pull Slip')),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note'),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.red,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.amber,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.green,
                                        //title: Text('Transmital Note'),
                                        value: true,
                                        onChanged: (val) {
                                          setState(() {});
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Pull Slip')),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note'),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.red,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.amber,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.green,
                                        //title: Text('Transmital Note'),
                                        value: true,
                                        onChanged: (val) {
                                          setState(() {});
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: onPressed,
                                child: Text('Print Pull Slip')),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: CheckboxListTile(
                                      title: Text('Transmital Note'),
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.red,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.amber,
                                        //title: Text('Transmital Note'),
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val;
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    // height: MediaQuery.of(context).size.height * 0.04,
                                    child: CheckboxListTile(
                                        tileColor: Colors.green,
                                        //title: Text('Transmital Note'),
                                        value: true,
                                        onChanged: (val) {
                                          setState(() {});
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: DataTable(
                        showCheckboxColumn: true,
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
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
                                  // setScreen('update');
                                });
                              },
                              cells: [
                                DataCell(Text('Kusite')),
                                DataCell(Text('HVVT56Y(500mm)')),
                                DataCell(Text('HVVT56Y')),
                                DataCell(Text('E')),
                                DataCell(Text('00654 ')),
                              ]),
                        ],
                      ),
                    ),
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
      _selectedMainProject = "Choose Main Project";
      _mainProjects = ["Choose Main Project"];
      _selectedMainProject = value;
      _mainProjects = List.from(_site)..addAll(repo.getProjects(_selectedSite));
    });
  }

  void _onSelectedSite(String value) {
    setState(() {
      _selectedSite = "Choose Site";
      _site = ["Choose Site"];
      _selectedSite = value;
      _site = List.from(_site)..addAll(repo.getSites());
    });
  }

  void onPressed() {}

  _onSelectedSchedule(String value) {
    setState(() {
      _selectedSchedule = "Choose Main Project";
      _schedule = ["Choose Main Project"];
      _selectedSchedule = value;
      //_schedule = List.from(_subProjects)..addAll(repo.getSchedule(value,_selectedS));
    });
  }

  _onSelectedSubProject(String value) {
    setState(() {
      _selectedSubProjects = "Choose Sub Project";
      _subProjects = ["Choose Sub Project"];
      _selectedSubProjects = value;
      _subProjects = List.from(_mainProjects)
        ..addAll(repo.getSubProject(value));
    });
  }
}

class Repository {
  List<Map> getAll() => _menuItems;

  getSchedule(String site, String subProject) => _menuItems
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.subproject.contains(subProject))
      .map((item) => item.subproject)
      .expand((i) => i)
      .toList();

  getSubProject(String site) => _menuItems
    ..map((map) => StateModel.fromJson(map))
        .where((item) => item.site == site)
        .map((item) => item.subproject)
        .toList();

  List<String> getProjects(String site) => _menuItems
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.site == site)
      .map((item) => item.mainproject)
      .toList();

  List<String> getSites() => _menuItems
      .map((map) => StateModel.fromJson(map))
      .map((item) => item.site)
      .toList();

  List _menuItems = [
    {
      "site": "site 1",
      "mainproject": "main project 1",
      "subproject": [
        {
          "1sub project 1": [
            "1schedule 1",
            "1schedule 2",
            "1schedule 3",
          ],
          "1sub project 2": [
            "1schedule 1",
            "1schedule 2",
            "1schedule 3",
          ],
          "1sub project 3": [
            "1schedule 1",
            "1schedule 2",
            "1schedule 3",
          ],
        }
      ],
    },
    {
      "site": "site 2",
      "mainproject": "main project 2",
      "subproject": [
        {
          "2sub project 1": {
            "schedule": [
              "2schedule 1",
              "2schedule 2",
              "2schedule 3",
            ],
          },
          "2sub project 2": {
            "schedule": [
              "2schedule 1",
              "2schedule 2",
              "2schedule 3",
            ],
          },
          "2sub project 3": {
            "schedule": [
              "2schedule 1",
              "2schedule 2",
              "2schedule 3",
            ],
          }
        }
      ],
    },
    {
      "site": "site 3",
      "mainproject": "main project 3",
      "subproject": [
        {
          "3sub project 1": {
            "schedule": [
              "3schedule 1",
              "3schedule 2",
              "3schedule 3",
            ],
          },
          "3sub project 2": {
            "schedule": [
              "3schedule 1",
              "3schedule 2",
              "3schedule 3",
            ],
          },
          "3sub project 3": {
            "schedule": [
              "3schedule 1",
              "3schedule 2",
              "3schedule 3",
            ],
          }
        }
      ],
    },
  ];
}
