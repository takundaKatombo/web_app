import 'dart:convert';
import 'package:web_app/model/ConfigData.dart';
import 'package:web_app/model/ResultObject.dart';
import 'package:encrypt/encrypt.dart' as enc;
final mykey = "3597a1b3c011eda3b49cca124d4d4e19";

class TransportJson {

  List<dynamic> entityElements;
  int site_id = -1 ;
  int master_site_id = -1;
  String method_to_call ;
  String site_name ;
  String whereClause ;
  String encryptionObject ;
  ResultObject resultsStatus ;
 // bool resultSuccess ;
 // String resultDescription ;

  TransportJson(
      {this.entityElements , this.site_id = -1 , this.master_site_id = -1,
        this.method_to_call, this.site_name = '' , this.whereClause = '' ,this.encryptionObject = '',
        this.resultsStatus = null  })
    {
      if (ConfigData().encrypt)
        this.encryptionObject = doEncAndBase64();
      if (entityElements is Null)
        entityElements =  [] ;
    }

  Map<String, dynamic> toJson() =>
      {
        'entityElements': entityElements,
        'site_id': site_id,
        'master_site_id': master_site_id,
        'method_to_call': method_to_call,
        'site_name': site_name,
        'whereClause': whereClause,
        'encryptionObject': encryptionObject,
        'resultsStatus': resultsStatus

      };

  factory TransportJson.fromJson(Map<String, dynamic> json) {
    var resultObj = ResultObject.fromJson(json['resultsStatus']);
    return TransportJson(
      entityElements: json['entityElements'],
      site_id: json['site_id'],
      master_site_id: json['master_site_id'],
      method_to_call: json['method_to_call'],
      site_name: json['site_name'],
      whereClause: json['whereClause'],
      encryptionObject: json['encryptionObject'],
      resultsStatus: resultObj,

    );
  }


  String doEncAndBase64()
  {
    //String jsonStr = '{"clientIP":"127.0.0.1","username":"Developer","loginUserID":"11","dontPerformSecCheck":false,"roles":["cms_sysadmin","cms_site_admin2"]}' ;
    Map jsonMap =
    {
      "clientIP": ConfigData().clientIp,
      "username": ConfigData().loggedInUserName,
      "loginUserID": ConfigData().loggedInUserID,
      "dontPerformSecCheck": ConfigData().dontPerformSecCheck,
      "roles": ConfigData().roles,
    };
    String jsonStr = jsonEncode(jsonMap);

    final key = enc.Key.fromBase16(mykey);
    final iv = enc.IV.fromLength(16);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.ecb));
    final encrypted = encrypter.encrypt(jsonStr, iv: iv);
//  final decrypted = encrypter.decrypt(encrypted, iv: iv);

    String base64Str = base64.encode(encrypted.bytes);
    return base64Str ;
  }

}