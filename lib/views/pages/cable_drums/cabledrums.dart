import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app/Model/mock_data/dataTable.dart';
import 'package:web_app/model/ConfigData.dart';
import 'package:web_app/model/stock/CableDrumsData.dart';
import 'package:web_app/model/stock/MaterialGroupLuData.dart';
import 'package:web_app/model/stock/ProductsData.dart';
import 'package:web_app/model/stock/SuppliersData.dart';
import 'package:web_app/services/locator.dart';
import 'package:web_app/utils/Constants.dart';
import 'package:web_app/utils/FieldMappings.dart';
import 'package:web_app/utils/Transmission.dart';
import 'package:web_app/controllers/bottomnotifications.dart';

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
  var _siteController = TextEditingController();
  var _productController = TextEditingController();
  var _drumController = TextEditingController();
  var _typeController = TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  //Paul vars
  String cablesGroupID = "" ;
  List<SuppliersData> supplierList = [];
  List<ProductsData> stockInProductsList = [];
  List<CableDrumsData> entitiesList = [];

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
                      onPressed: (){ getEntitiesList(whereClause: '', nativeQuery: false) ;},
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
                            (tableDetail) => DataRow(cells: [
                              DataCell(
                                GestureDetector(
                                  child: Text(tableDetail['Site'].toString()),
                                  onDoubleTap: () {
                                    _siteController.text = tableDetail['Site'];
                                    _productController.text =
                                        tableDetail['Product'];
                                    _drumController.text = tableDetail['Drum'];
                                    _typeController.text = tableDetail['type'];
                                    setState(() {
                                      setScreen('update');
                                    });
                                  },
                                ),
                              ),
                              DataCell(
                                GestureDetector(
                                  child:
                                      Text(tableDetail['Product'].toString()),
                                  onDoubleTap: () {
                                    _siteController.text = tableDetail['Site'];
                                    _productController.text =
                                        tableDetail['Product'];
                                    _drumController.text = tableDetail['Drum'];
                                    _typeController.text = tableDetail['type'];
                                    setState(() {
                                      setScreen('update');
                                    });
                                  },
                                ),
                              ),
                              DataCell(
                                GestureDetector(
                                  child: Text(tableDetail['type'].toString()),
                                  onDoubleTap: () {
                                    _siteController.text = tableDetail['Site'];
                                    _productController.text =
                                        tableDetail['Product'];
                                    _drumController.text = tableDetail['Drum'];
                                    _typeController.text = tableDetail['type'];
                                    setState(() {
                                      setScreen('update');
                                    });
                                  },
                                ),
                              ),
                              DataCell(
                                GestureDetector(
                                  child: Text(tableDetail['Drum'].toString()),
                                  onDoubleTap: () {
                                    _siteController.text = tableDetail['Site'];
                                    _productController.text =
                                        tableDetail['Product'];
                                    _drumController.text = tableDetail['Drum'];
                                    _typeController.text = tableDetail['type'];
                                    setState(() {
                                      setScreen('update');
                                    });
                                  },
                                ),
                              ),
                            ]),
                          )
                          .toList(),
                    ),
                  ),
                ),
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
                                  child: Text('Site '),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: _siteController,
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Product'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: _productController,
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Type '),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: _typeController,
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Drum'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: _drumController,
                                  ),
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


  //Paul Code

  void init() async
  {
    //todo Busy indicator start
    List<dynamic> entityElements = [] ; // [sqlUpdateText];
    ///    // er({bool issPost,List<dynamic> entityElements , String endPoint, String methodToCall})
    String whereClause = " m."+ FieldMappings().MATERIAL_GROUP_LU_GROUP_CONSTANT_ID + " = " + Constants.CONSTANT_ID_MATERIAL_GROUP_CABLE.toString() ;
    List resultElements = await getElementsFromServer(isPost: true, entityElements: entityElements, endPoint: ConfigData().listSiteControlURL, methodToCall: Constants.METHOD_MATERIAL_GROUP_LIST, whereClause: whereClause);
    if (resultElements != null)
    {
      MaterialGroupLuData mg = MaterialGroupLuData.fromJson(resultElements[0]);
      cablesGroupID = mg.mat_group_id ;
      /*for (int i=0 ; i< resultElements.length ; i++)
      {
        //Todo Populate some field if required
        //Todo add message to status window??
        //litems.addNotification('Execute pressed ') ;
        MaterialGroupLuData mg = MaterialGroupLuData.fromJson(resultElements[i]);
        print("TWO: "+mg.description);
      }*/

      //No need to get
      getSuppliersList();

    }

  }
  void getSuppliersList() async
  {
    String whereClause  = '';
    supplierList.clear();
    if (cablesGroupID != null)
    {
      whereClause  = "m.mat_group_id='"  +cablesGroupID+"'" ;
    }
    List resultElements = await getElementsFromServer(isPost: true, entityElements: [] , endPoint: ConfigData().siteControlURL, methodToCall: Constants.METHOD_SUPPLIERS_LIST_BY_MAT_GROUP, whereClause: whereClause);
    supplierList = resultElements.map((i) => SuppliersData.fromJson(i)).toList();
    getListOfProductsByWhere("");
  }
  void getListOfProductsByWhere(String whereClause) async
  {
    stockInProductsList.clear();

    List resultElements = await getElementsFromServer(isPost: true, entityElements: [] , endPoint: ConfigData().listSiteControlURL, methodToCall: Constants.METHOD_PRODUCTS_LIST, whereClause: whereClause);
    stockInProductsList = resultElements.map((i) => ProductsData.fromJson(i)).toList();
    //todo Busy indicator stop
    //print("pause");
  }
  // Get the relavent entities for this page
  void getEntitiesList({String whereClause, bool nativeQuery}) async
  {
    //todo Busy indicator start

    entitiesList.clear();
    bool ignoreServerSideActiveRestriction = false;
    //Todo -- need to execute below if "Non-Active is selected on Datagrid"
    /*if (dataGrid != null)
    {

      if (dataGrid.showDeletedCB.selected)
      {
        if (whereClause != "" ) whereClause += " and " ;
        whereClause += "m.active='N'";
        ignoreServerSideActiveRestriction = true ;
      }
    }

     */



    //build additional whereClause
    //   i
    //if (( incompleteDrums.selected) && ( emptyDrumsCB == 'yes')
    if (( _incompleteDrumsCB) && ( _emptyDrumsCB))
    {
      ; //Dont do any where clause on this field
    }
    else
    {
      if ( _incompleteDrumsCB)
      {
        if (whereClause != "" ) whereClause += " and " ;
        whereClause += "m."+FieldMappings().CABLE_DRUMS_DRUM_EMPTY +"='N'" ;
      }

      if ( _emptyDrumsCB)
      {
        if (whereClause != "" ) whereClause += " and " ;
        whereClause += "m."+FieldMappings().CABLE_DRUMS_DRUM_EMPTY +"='Y'" ;
      }
    }
//todo get sitePicker working
    // Single Site Picker
    /* if (sitePicker.visible)
    {

      if ( sitePicker.selectedSiteID > 0)
      {
        transJson.sitePickerCallSingle = true ;
        transJson.sitePickerSelectedSiteId = sitePicker.selectedSiteID ;

      }
    }
    */
    print("WhereClause : "+whereClause);

    List resultElements = [] ;
    if (nativeQuery)  resultElements = await getElementsFromServer(isPost: true, entityElements: [] , endPoint: ConfigData().nativeQueriesURL +"cableDrumsNativeQuery", methodToCall: Constants.METHOD_CABLE_DRUMS_LIST, whereClause: whereClause, ignoreServerSideActiveRestriction: ignoreServerSideActiveRestriction);
    else  resultElements = await getElementsFromServer(isPost: true, entityElements: [] , endPoint: ConfigData().listSiteControlURL, methodToCall: Constants.METHOD_CABLE_DRUMS_LIST, whereClause: whereClause, ignoreServerSideActiveRestriction: ignoreServerSideActiveRestriction);

    entitiesList = resultElements.map((i) => CableDrumsData.fromJson(i)).toList();
   // print(whereClause);
    print("Length: "+entitiesList.length.toString());
    //Todo busy indicator stop
    locator<BottomNotifications>().addNotification('Cable drums list Successful',true);
  }

}
