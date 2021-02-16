
import 'package:web_app/model/stock/MaterialGroupLuData.dart';
import 'package:web_app/model/stock/StockLocationData.dart';
import 'package:web_app/model/stock/UOMData.dart';
import 'package:web_app/utils/FieldMappings.dart';

class ProductsData {

  String product_id ;
  String sap_id ;
  String long_desc ;
  String uom_id ;
  String photo_url = '';
  double avg_price_per_uom = 0.0 ;
  String high_value ;
  String barcode ;
  String ignore_recon_site_list ="";
  String docs_url = '';
  String product_name ;
  String mat_type_id ;
  double reorder_level = 10 ;  // NB might be an int !!
  String username  ;
  String roshcon_uuid ;
  String active ;
  String cable_type ;
  String sap_desc ;
  int flags ;
  double recon_tol_perc = 0.1 ;
  String cable_code ;
  String uom_confirm ;
  int recon_mth_freq =  3 ;
  String mat_group_id ;
  String uom_confirm_message = "Please confirm UOM correct?";
  //	String stock_loc_id:String ;
  double productTotal  = 0  ;

  String supplier_specific ;
  String stock_bin_trans_id ; // This is not used as a field in the products table but is required for use in GUI stockOutForm

  // Info of FK's only
  String mat_group_name ; //= CMS3_GUI.config.FKFieldNotice ;// ( just for listing the name and avoiding another query)
  String uom_name ; //= CMS3_GUI.config.FKFieldNotice ; //  ( just for listing the name and avoiding another query)
  String mat_type_name ; //= CMS3_GUI.config.FKFieldNotice ; //  ( just for listing the name and avoiding another query)
  String stock_location_name ; //= CMS3_GUI.config.FKFieldNotice ; //  ( just for listing the name and avoiding another query)

  String stock_loc_id ; //  ( just for listing the name and avoiding another query)

  ProductsData(
    {
      this.product_id, this.sap_id,this.long_desc , this.uom_id, this.photo_url, this.avg_price_per_uom,this.high_value, this.barcode,
      this.ignore_recon_site_list, this.docs_url,this.product_name, this.mat_type_id, this.reorder_level,this.username, this.roshcon_uuid,
      this.active, this.cable_type,this.sap_desc, this.flags, this.recon_tol_perc, this.cable_code,this.uom_confirm, this.recon_mth_freq,
      this.mat_group_id, this.uom_confirm_message,this.productTotal, this.supplier_specific, this.stock_bin_trans_id,this.stock_loc_id,
      this.mat_group_name, this.uom_name,this.mat_type_name, this.stock_location_name
    }
    ) {  }

  Map<String, dynamic> toJson() =>
      {

        'product_id': product_id,
        'sap_id': sap_id,
        'long_desc': long_desc.toUpperCase(),
        'uom_id': uom_id,
        'photo_url': photo_url,
        'avg_price_per_uom': avg_price_per_uom ,
        'high_value': high_value,
        'barcode': barcode,
        'ignore_recon_site_list': ignore_recon_site_list,
        'docs_url': docs_url,
        'product_name': product_name.toUpperCase(),
      
        'mat_type_id': mat_type_id,
        'reorder_level': reorder_level,
        'username': username,
        'roshcon_uuid': roshcon_uuid,
        'active': active,
      
        'cable_code': cable_code,
        'uom_confirm': uom_confirm,
        'recon_mth_freq': recon_mth_freq,
        'mat_group_id': mat_group_id,
        'uom_confirm_message': uom_confirm_message,
        'stock_loc_id': stock_loc_id,
        'supplier_specific': supplier_specific,
        'productTotal' : productTotal,
        'stock_bin_trans_id': stock_bin_trans_id,
        'sap_desc': sap_desc.toUpperCase(),
        'flags': flags,
        'recon_tol_perc': recon_tol_perc  ,
        'cable_type': cable_type

};

  factory ProductsData.fromJson(Map<String, dynamic> inputJson) {

    String temp_uom_name = inputJson["uom_name"] ;
    if (inputJson.containsKey(FieldMappings().EXTERNAL_OBJECT_UOM))
    {
      UOMData uomObj= UOMData.fromJson(inputJson[FieldMappings().EXTERNAL_OBJECT_UOM]);
      temp_uom_name = uomObj.uom_name ;
    }

    String temp_mat_group_name = inputJson["mat_group_name"] ;
    if (inputJson.containsKey(FieldMappings().EXTERNAL_OBJECT_MATERIAL_GROUP_JSON))
    {
      MaterialGroupLuData theObj= MaterialGroupLuData.fromJson(inputJson[FieldMappings().EXTERNAL_OBJECT_MATERIAL_GROUP_JSON]);
      temp_mat_group_name = theObj.group_name ;
    }


    String temp_stock_location_name = inputJson["stock_location_name"] ;
    if (inputJson.containsKey(FieldMappings().EXTERNAL_OBJECT_STOCK_LOCATION))
    {
      StockLocationData theObj= StockLocationData.fromJson(inputJson[FieldMappings().EXTERNAL_OBJECT_STOCK_LOCATION]);
      temp_stock_location_name = theObj.location_name ;
    }
    double temp_productTotal = 0 ;//inputJson["productTotal"]  ;
    if (inputJson.containsKey(FieldMappings().PRODUCTS_LU_PRODUCT_TOTAL))
    {

      temp_productTotal = inputJson[FieldMappings().PRODUCTS_LU_PRODUCT_TOTAL] ;
    }
    String temp_stock_bin_trans_id ='' ;
    if ( inputJson.containsKey("stock_bin_trans_id")) temp_stock_bin_trans_id = inputJson["stock_bin_trans_id"] ;

    return ProductsData(
        uom_name: temp_uom_name ,
        mat_group_name: temp_mat_group_name ,
        stock_location_name: temp_stock_location_name ,
        productTotal: temp_productTotal,
        stock_bin_trans_id: temp_stock_bin_trans_id,


        stock_loc_id: inputJson["stock_loc_id"] ,
        product_id: inputJson["product_id"] ,
        sap_id: inputJson["sap_id"] ,
        long_desc: inputJson["long_desc"] ,
        uom_id: inputJson["uom_id"] ,
        photo_url: inputJson["photo_url"] ,
        avg_price_per_uom: inputJson["avg_price_per_uom"] ,
        high_value: inputJson["high_value"] ,
        barcode: inputJson["barcode"] ,
        ignore_recon_site_list: inputJson["ignore_recon_site_list"] ,
        docs_url: inputJson["docs_url"] ,
        product_name: inputJson["product_name"] ,
        mat_type_id: inputJson["mat_type_id"] ,
        reorder_level: inputJson["reorder_level"] ,
        username: inputJson["username"] ,
        roshcon_uuid: inputJson["roshcon_uuid"] ,
        active: inputJson["active"] ,
        cable_code: inputJson["cable_code"] ,
        uom_confirm: inputJson["uom_confirm"] ,
        recon_mth_freq: inputJson["recon_mth_freq"] ,
        mat_group_id: inputJson["mat_group_id"] ,
        uom_confirm_message: inputJson["uom_confirm_message"] ,
        supplier_specific: inputJson["supplier_specific"] ,
        sap_desc: inputJson["sap_desc"] ,
        flags: inputJson["flags"] ,
        recon_tol_perc: inputJson["recon_tol_perc"] ,
        cable_type: inputJson["cable_type"]


    );
  }
}
