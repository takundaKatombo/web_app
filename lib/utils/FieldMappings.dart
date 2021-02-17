class FieldMappings
{
  static final FieldMappings _singleton = FieldMappings._internal();
  factory FieldMappings() {
    return _singleton;
  }
  FieldMappings._internal();

  /** Common  */
  final String SITES_SITE_ID = "site_id";
  final String SITES_SITE_NAME = "site_name";


  /** Access Control */
  final String CODE_ACCESS_METHOD_NAME = "method_name";
  final String CODE_ACCESS_ROLE_NAME = "role_name";

  /** Material group */
  final String MATERIAL_GROUP_LU_GROUP_NAME = "group_name" ;
  final String MATERIAL_GROUP_LU_GROUP_CONSTANT_ID = "constant_id" ;

  // Objects to return
  final String EXTERNAL_OBJECT_UOM = "UOM_Json";
  final String EXTERNAL_OBJECT_MATERIAL_TYPE_JSON = "MatType_Json";
  final String EXTERNAL_OBJECT_MATERIAL_GROUP_JSON = "MatGroup_Json";
  final String EXTERNAL_OBJECT_STOCK_LOCATION = "StockLocation_Json";

  /** Products */
  final String PRODUCTS_LU_PRODUCT_ID = "product_id";
  final String PRODUCTS_LU_SAP_ID = "sap_id";
  final String PRODUCTS_LU_PRODUCT_NAME = "product_name";
  final String PRODUCTS_LU_PRODUCT_TOTAL= "productTotal";
  final String PRODUCTS_LU_MAT_GROUP_ID = "mat_group_id";
  final String PRODUCTS_LU_LONG_DESC = "long_desc";
  final String PRODUCTS_LU_SAP_DESC = "sap_desc";

  /** Cable drums */
/*  final String CABLE_DRUMS_BIN_ID = "bin_id";
  final String CABLE_DRUMS_DRUM_ID = "drum_id";
  final String CABLE_DRUMS_DRUM_NUMBER = "drum_number";
  final String CABLE_DRUMS_PRODUCT_ID = "product_id";*/
  final String CABLE_DRUMS_DRUM_EMPTY = "drum_empty";
/*
  final String CABLE_DRUMS_MAIN_PROJECT_ID = "main_project_id";
  final String CABLE_DRUMS_RECIEVE_TRANS_TYPE_NAME = "trans_type_name";
  final String CABLE_DRUMS_RECIEVE_TRANS_TYPE_CONSTANT_ID = "trans_type_constant_id";
  final String CABLE_DRUMS_INVOICED = "invoiced";
  final String CABLE_DRUMS_MDS_STATUS = "mds_status";
  final String CABLE_DRUMS_MDS_RATE = "mds_rate";
  final String CABLE_DRUMS_DRUM_TYPE = "drum_type";
*/

}