
import 'package:web_app/utils/GeneralUtils.dart';

class CableDrumsData {

  String bin_id ;
  double drum_quantity ;
  String drum_type  ;
  String drum_empty  ;


  String drum_id  ;
  String main_project_id  ;
  String main_project_name  ;
  String drum_number  ;
  String manu_batch_num  ;
  String supplier_drum_no  ;
  double electric_speed  ;
  double meters_measured ;
  double meters_received ;
  String active  ;
  String username   ;
  String product_id  ;
  String product_name  ;
  int site_id ;
  String condition  ;
  String prev_drum_number  ;
  int trans_type_constant_id ;
  int invoice_period ;
  double invoice_value ;
  String trans_type_name  ;
  String invoiced  ;
  int mds_rate ;
  String mds_status  ;
  String empty_verified  ;
  int flags ;
  String cable_code  ;
  String supplier_id  ;
  String supplier_name  ;
  String delivery_note_no  ;
  DateTime receive_date ;
  String comments  ;
  String DSP_receive_date  ;
  String invoice_method  ;
  // Required for Pulls capture
  String mat_group_id  ;
  String uom_id  ;
  // Info of FK's only
  String site_name  ;

  CableDrumsData(
      {
        this.product_id, this.bin_id,this.drum_quantity , this.uom_id, this.drum_type, this.drum_empty,this.drum_id, this.main_project_id,
        this.main_project_name, this.drum_number,this.product_name, this.manu_batch_num, this.supplier_drum_no,this.username, this.electric_speed,
        this.active, this.meters_measured,this.meters_received, this.flags, this.site_id, this.cable_code,this.condition, this.prev_drum_number,
        this.mat_group_id, this.trans_type_constant_id,this.invoice_period, this.invoice_value, this.trans_type_name,this.invoiced,
        this.mds_rate, this.mds_status,this.empty_verified, this.supplier_id, this.supplier_name, this.delivery_note_no,this.receive_date ,
        this.comments, this.DSP_receive_date,this.invoice_method, this.site_name
      }
      ) {  }

  Map<String, dynamic> toJson() =>
      {

        'product_id': product_id,
         'drum_id': drum_id ,
         'main_project_id': main_project_id ,
         'main_project_name': main_project_name ,
         'drum_number': drum_number.toUpperCase() ,
         'product_id':  product_id ,
         'supplier_drum_no':  supplier_drum_no ,
         'site_id': site_id as int ,
         'electric_speed': electric_speed as double,
         'meters_measured': meters_measured  as double,
         'bin_id':  bin_id ,
         'manu_batch_num':  manu_batch_num ,
         'meters_received': meters_received as double ,
         'drum_quantity': drum_quantity as double ,

         'drum_type':  drum_type ,
         'drum_empty':  drum_empty ,
         'username':  username ,
         'active':  active ,
         'product_name':  product_name ,
         'cable_code':  cable_code ,
         'condition':  condition ,
         'prev_drum_number':  prev_drum_number ,
         'site_name':  site_name ,

         'invoice_period': invoice_period as int ,
         'invoice_value': invoice_value as double ,
         'trans_type_name':  trans_type_name ,
         'invoiced':  invoiced ,
         'mds_status':  mds_status ,
         'mds_rate': mds_rate as int ,
         'trans_type_constant_id': trans_type_constant_id as int ,

         'flags': flags as int ,
         'empty_verified':  empty_verified ,

         'supplier_id':  supplier_id ,
         'supplier_name':  supplier_name ,
         'delivery_note_no':  delivery_note_no ,
         'comments':  comments ,
         'receive_date': receive_date , //CMS3_GUI.globalData.dateToStrin

         'invoice_method':  invoice_method ,

         'mat_group_id':  mat_group_id ,
         'uom_id':  uom_id ,


};

  factory CableDrumsData.fromJson(Map<String, dynamic> inputJson) {


    String temp_product_name = "";
    if (inputJson.containsKey("product_name"))
    {
      temp_product_name = inputJson["product_name"];
    }
    String temp_cable_code = "";
    if (inputJson.containsKey("cable_code"))
    {
      temp_cable_code= inputJson["cable_code"];
    }
    String temp_site_name = "";
    if (inputJson.containsKey("site_name"))
    {
      temp_site_name = inputJson["site_name"];
    }
    DateTime receiveDate = null;
    if (inputJson.containsKey("receive_date"))
    {
      receiveDate = dateFromString(inputJson["receive_date"]);
    }
    return CableDrumsData(
        product_name: temp_product_name ,
        cable_code: temp_cable_code ,
        site_name: temp_site_name ,

        drum_id: inputJson["drum_id"] ,
        main_project_id: inputJson["main_project_id"] ,
        main_project_name: inputJson["main_project_name"] ,
        drum_number: inputJson["drum_number"] ,
        product_id: inputJson["product_id"] ,
        supplier_drum_no: inputJson["supplier_drum_no"] ,
        site_id: inputJson["site_id"] ,
        electric_speed: inputJson["electric_speed"] ,
        meters_measured: inputJson["meters_measured"] ,
        bin_id: inputJson["bin_id"] ,
        manu_batch_num: inputJson["manu_batch_num"] ,
        meters_received: inputJson["meters_received"] ,
        drum_quantity: inputJson["drum_quantity"] ,
        drum_type: inputJson["drum_type"] ,
        drum_empty: inputJson["drum_empty"] ,
        condition: inputJson["condition"] ,
        username: inputJson["username"] ,
        active: inputJson["active"] ,
        prev_drum_number: inputJson["prev_drum_number"] ,
        invoice_period: inputJson["invoice_period"] ,
        invoice_value: inputJson["invoice_value"] ,
        trans_type_name: inputJson["trans_type_name"] ,
        invoiced: inputJson["invoiced"] ,
        mds_status: inputJson["mds_status"] ,
        mds_rate: inputJson["mds_rate"] ,
        flags: inputJson["flags"] ,
        empty_verified: inputJson["empty_verified"] ,
        trans_type_constant_id: inputJson["trans_type_constant_id"] ,

        supplier_id: inputJson["supplier_id"] ,
        supplier_name: inputJson["supplier_name"] ,
        delivery_note_no: inputJson["delivery_note_no"] ,
        comments: inputJson["comments"] ,
        receive_date: receiveDate ,
        DSP_receive_date: "needToFixStill", // receive_date ,  //CMS3_GUI.globalData.prettyDateDisplay


        invoice_method: inputJson["invoice_method"] ,
        mat_group_id: inputJson["mat_group_id"] ,
        uom_id: inputJson["uom_id"]


    );
  }
}
