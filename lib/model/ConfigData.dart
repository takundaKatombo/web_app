import 'package:web_app/model/admin/RRSitesData.dart';
import 'package:web_app/model/admin/SitesData.dart';


class ConfigData
{
  static final ConfigData _singleton = ConfigData._internal();
  factory ConfigData() {
    return _singleton;
  }
  ConfigData._internal();


  bool encrypt = true ; //The encryption is done both ends
  bool dontPerformSecCheck = true ; //Nothing to do with encryptiuon, but this allows any role access
  //Todo Paul need to set dontPerformSecCheck to fals

  bool adminUser ; //= 'cms_sysadmin';
  String protocol ;
  String serverAdd ;
  String baseURL =  "/CMS3/services/";
  // Site info
  int site_id = -2;  // Needs to be set by server
  String site_name ;
  int master_site_id = -2; // Needs to be set by server
  String masterMachineName ="Temp"; // Needs to be set by server
  String masterLicenseServerURL ;
  List<SitesData> sitesList =[] ;
  List<SitesData> sitesList_withAllSites =[] ;
  List<RRSitesData> rrSitesList =[] ;
  List<RRSitesData> rrSitesList_WithAll =[] ;

  Map authorizationMap;
  String clientIp ="127.0.0.1";
  String loggedInUserName = "";
  int loggedInUserID = -1;
  List<String> roles =[];
  String serverAddress ="http://localhost:8080";  // Will be overwritten if in release build
  // RBA Access Control
  Map RBAMap = new Map();
  //URL's
  // protocol + serverAdd + baseURL +  PAul need to get these dynamically
  String siteControlURL =  "Init/siteControl/" ;
  String listSiteControlURL = "List/siteControl" ;
  String nativeQueriesURL = "nativeQueries/" ;


}