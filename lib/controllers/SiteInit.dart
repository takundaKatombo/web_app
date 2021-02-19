import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:web_app/model/ConfigData.dart';
import 'package:web_app/model/TransportJson.dart';
import 'package:web_app/model/admin/RRSitesData.dart';
import 'package:web_app/model/admin/SitesData.dart';
import 'package:web_app/utils/Constants.dart';
import 'package:web_app/utils/FieldMappings.dart';
import 'package:web_app/utils/Transmission.dart';

/// Called on load of system
/// 1. check if this is a new install or not
/// 2. setup variables from the server
///  3. Get list of available roles
///
class SiteInit {

  void initApp() async {
    try {
      ConfigData().loggedInUserName = "Developer";
      ConfigData().roles.add("cms_sysadmin");
      String url = window.location.href;
      final uri = Uri.parse(url);
      String currentURI = uri.scheme + "//" + uri.host + ":" +
          uri.port.toString();
      if (kReleaseMode) ConfigData().serverAddress = "";//  currentURI; //Only set in prod because Android Studio makes unique server
      ConfigData().protocol = uri.scheme;

      /// Get roles
      List elements = await getElementsFromServer(isPost: true, endPoint: ConfigData().listSiteControlURL, methodToCall: Constants.METHOD_CODE_ACCESS_LIST);

      //Map roleMap = new Map();
      for (int i = 0; i < elements.length; i++) {
        List rolesArray = [];
        String roleName = elements[i][FieldMappings().CODE_ACCESS_ROLE_NAME];
        String methodName = elements[i][FieldMappings()
            .CODE_ACCESS_METHOD_NAME];
        if (ConfigData().RBAMap.containsKey(methodName)) {
          rolesArray = ConfigData().RBAMap[methodName] as List;
        }
        rolesArray.add(roleName);
        ConfigData().RBAMap[methodName] = rolesArray;
      }

      /// Example of getting Staff department data
      // List elements = await getElementsFromServer(ConfigData().listSiteControlURL,Constants().METHOD_STAFF_DEPARTMENT_LIST);
      // List<StaffDepartmentData> itemsList = elements.map((i) => StaffDepartmentData.fromJson(i)).toList();
      // print('Staff Department Name : ${itemsList[0].department_name}');
      // List elements = await httpGet("Init/initiator");


      // Reset Config settings
      ConfigData().loggedInUserName = "";
      ConfigData().roles.clear();
      //print("Completed initApp");
     /*
      ConfigData().log.i("Completed initApp");
      ConfigData().log.i("Test info");
      ConfigData().log.d("Test debug");
      ConfigData().log.w("Test warn");
      ConfigData().log.e("Test error");
      ConfigData().log.wtf("Test wtf");
      */

      await siteInit();
    } catch (e) {
      //TODO need to log
      print(e);
    }
  }

  void siteInit() async {
    try {
      print("Starting siteInit");
      TransportJson jsonMap = await httpGet("Init/initiator");
      int site_id = jsonMap.site_id; // [FieldMappings().SITES_SITE_ID];

      //{machine_name: cms_kusile, master_machine_name: cms_kusile, master_site_id: 1, site_admin_id: null, site_id: 1, site_name: Kusile, last_used_seq: 0, site_tel: , active: Y}//

      if (site_id == -1) {
        //currentState = "createSite_step1";
        // TODO PAUL We need to open the new site creater page
      } else {
        ConfigData().site_id = site_id;
        setSiteSettings(jsonMap, site_id);

        //Now test to make sure we have the global settings required for all operations
        if ((ConfigData().masterMachineName == "") ||
            (ConfigData().site_id == -1) ||
            (ConfigData().master_site_id == -1)) {
          //Alert.show("Cannot continue, because we cant get the site_id set from server : "+ config.serverAdd);
          //TODO  Need an alert function here
        } else {

          ConfigData().rrSitesList.clear();
         // er({bool issPost,List<dynamic> entityElements , String endPoint, String methodToCall})
         List rrsiteElements = await getElementsFromServer( isPost: true, endPoint: ConfigData().listSiteControlURL,methodToCall: Constants.METHOD_CODE_ACCESS_LIST);
         List<RRSitesData> itemsList = rrsiteElements.map((i) => RRSitesData.fromJson(i)).toList();
         if (itemsList.length > 0) {
           RRSitesData entity2 = RRSitesData(rrsite_id: "-1", site_name: "ALL");
         }
         for (int i = 0; i < itemsList.length; i++) {
           ConfigData().rrSitesList.add(itemsList[i]);
           ConfigData().rrSitesList_WithAll.add(itemsList[i]);
         }
             //TODO PAUL need to login at this stage
            // currentState = "loggedIn";
        }


        //currentState = "createSite_step1";
      }
    } catch (e) {
      print(e);
    }
  }


  void setSiteSettings(TransportJson jsonObj, int suppliedSite_id) {
    List jsArray = jsonObj.entityElements;
    ConfigData().sitesList.clear() ; //removeRange(0, ConfigData().sitesList.length); //removeAll() ;
    ConfigData().sitesList_withAllSites = [] ;//.removeRange(0, ConfigData().sitesList.length); //removeAll() ;
    if (jsArray.length > 0) {
      for (int i = 0; i < jsArray.length; i++) {
        // SitesData siteObject= new SitesData() ;
        SitesData siteObject = SitesData.fromJson(jsArray[i]);

        ConfigData().sitesList.add(siteObject);
        ConfigData().sitesList_withAllSites.add(siteObject);
        if (siteObject.site_id == suppliedSite_id) {
          ConfigData().masterMachineName = siteObject.master_machine_name;
          ConfigData().site_id = siteObject.site_id;
          ConfigData().site_name = siteObject.site_name;
          ConfigData().master_site_id = siteObject.master_site_id;
        }
      }
      ConfigData().masterLicenseServerURL =
          ConfigData().protocol + ConfigData().masterMachineName +
              ConfigData().baseURL + "List/siteControl";

      ///setDelayedSiteSpecificVars();

      // Add the ALL site option
      var allSites = new SitesData(active: 'Y',
          last_used_seq: -1,
          site_id: -2,
          master_site_id: -1,
          site_name: "All Sites");
          {
            ConfigData().sitesList_withAllSites.add(allSites);
          }
    }
  }


/*
  <field label="Issues Admin" data="cms_issues" />
  <field label="Invoicing Admin" data="cms_invoicing" />
  <field label="Products Maintain" data="cms_products_maintain" />
  <field label="Projects Admin" data="cms_project_admin" />
  <field label="Read Only" data="cms_read_only" />
  <field label="SAP Projects Admin" data="cms_sap_project_admin" />
  <field label="Staff Admin" data="cms_staff_admin" />
  <field label="Staff Read Only" data="cms_staff_read_only" />
  <field label="Site Admin" data="cms_site_admin" />
  <field label="Site Manager" data="cms_site_manager" />
  <field label="Stock Controller" data="cms_stock_controller" />
  <field label="SysAdmin" data="cms_sysadmin" />
  <field label="Tools Maintenance Admin" data="cms_tool_move_admin" />
  <field label="Tools Movements Admin" data="cms_tool_maint_admin" />
  <field label="World-wide Read Only" data="cms_ww_read_only" />
  */
} //End Class