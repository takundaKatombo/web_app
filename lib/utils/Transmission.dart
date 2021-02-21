import 'dart:convert';
import 'package:web_app/model/ConfigData.dart';
import 'package:web_app/model/ResultObject.dart';
import 'package:web_app/model/TransportJson.dart';
import 'package:http/http.dart' as http;
import 'package:web_app/services/locator.dart';
import 'package:web_app/controllers/bottomnotifications.dart';

//var litems = Provider.of<BottomNotifications>(context);

Future<TransportJson> httpGet(String endPoint) async {

  http.Response response = await http.get(ConfigData().serverAddress + ConfigData().baseURL  + endPoint);

  if (response.statusCode == 200)
  {
    return TransportJson.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw new Exception("Get request failed with : "+response.reasonPhrase);
  }
}

Future<TransportJson> httpPost(String strData, String endPoint) async {

 // String strData1 = '{"entityElements":[],"site_id":1,"master_site_id":2,"method_to_call":"liststaffDepartment","encryptionObject":"zTAKYSSKHfdWwONl7nKQbDVw9VgReoNNIT8lNrxbvV+32I2z\/emPDJ7j65oM6EPjjhB7mGjTbK2GtuF9QkQ7MeawlvO6U+av7zMJ8VkncjhvtmJcHIyQ+hBxMki\/zm+RR7f36PpzXbIlc7LCjeJxCp1Vc6agP58WcciRbTAGjBu7MwVJP6m5ftOSCGu08TXy","whereClause":""}';

  var url = ConfigData().serverAddress+ ConfigData().baseURL + endPoint;

  http.Response response = await http.post(url, headers: {"Content-Type": "application/json"}, body: strData);

  if (response.statusCode == 200)
    {
     // Map jsonMap = jsonDecode(response.body);//.cast<Map<String, dynamic>>();
     // return jsonMap ;
     return TransportJson.fromJson(jsonDecode(response.body));
    }
  else
    {
      throw new Exception("POST request failed with : "+response.reasonPhrase);
    }

}


/*********************** Helper Functions *****************************/


/// This does all that is required to CREATE & send a transport object to server and encrpyts if required
///  Returns : List of entities that need to be cast to the correct VO
///  Casting Example
///     List<StaffDepartmentData> itemsList = elements.map((i) => StaffDepartmentData.fromJson(i)).toList();
///     print('Staff Department Name : ${itemsList[0].department_name}');
Future<List> getElementsFromServer({bool isPost,List<dynamic> entityElements , String endPoint, String methodToCall, String whereClause, bool ignoreServerSideActiveRestriction})
async {

  try {
    TransportJson relsultTransObj ;
   //bool doPost = false;

    if (isPost)
      {
        TransportJson  transObj = buildTransportJson(entityElements: entityElements,method_to_call: methodToCall, whereClause: whereClause, ignoreServerSideActiveRestriction: ignoreServerSideActiveRestriction);
        String jsonStr = jsonEncode(transObj);
        relsultTransObj = await httpPost(jsonStr, endPoint);
      }
    else
      {
        relsultTransObj = await httpGet(endPoint);
      }


    ResultObject  resultStatus = relsultTransObj.resultsStatus as ResultObject;
    if (! resultStatus.resultSuccess)
    {
      locator<BottomNotifications>().addNotification(resultStatus.resultDescription,false);
      //print('Server Response :  ${resultStatus.resultDescription}');
      return null;
    }
    else
      {
      //  locator<BottomNotifications>().addNotification('Success');
      }

    return relsultTransObj.entityElements as List;

  } catch (e) {
    locator<BottomNotifications>().addNotification('Server Response :'+e.toString(), false);
    //print(e);
    //throw new Exception("getElementsFromServer failed with : ${e}" );
  }
}


/*
Build a transport object, this includes encrypted json if ConfigData().encrypt == true
 */
TransportJson buildTransportJson({List<dynamic> entityElements, String method_to_call, String whereClause ,bool ignoreServerSideActiveRestriction} )
{
  String whereClause2 = whereClause?.isEmpty ?? true ? "": whereClause;
  if (( ConfigData().masterMachineName == "") || (ConfigData().site_id == -1 ) || (ConfigData().master_site_id == -1))
  {// Need to figure out alert
    //Alert.show("Cannot continue, the site_id was not set, from server : "+ config_serverAdd);
    // showAlert().onBasicAlertPressed(context) ;//(title: Text("Cannot continue, the site_id was not set, from server : "+ config_serverAdd));
    throw new Exception("Cannot continue, the site_id was not set, from server : "+ ConfigData().serverAddress);
  }
  else
  {
   // if (entityElements == null ) entityElements = [] ;
    return TransportJson(entityElements: entityElements, site_id : ConfigData().site_id, master_site_id: ConfigData().master_site_id ,method_to_call: method_to_call, whereClause: whereClause2, ignoreServerSideActiveRestriction: ignoreServerSideActiveRestriction);
  }
}