class Constants
{
  static final Constants _singleton = Constants._internal();
  factory Constants() {
    return _singleton;
  }
  Constants._internal();


  /* Constant ids  */
  static const int CONSTANT_ID_MATERIAL_GROUP_CABLE = 4 ;
  static const int CONSTANT_ID_MATERIAL_GROUP_EARTHING = 12 ;
  static const int CONSTANT_ID_MATERIAL_GROUP_TOOL_SERVICABLE = 34 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_ORDER_IN = 1 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_FREE_ISSUE_IN = 2 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_RETURN_IN = 3 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_TRANSFER_IN = 4 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_RECON = 6 ;
  static const int CONSTANT_ID_TRANSACTION_TYPE_TRANSFER_OUT = 8 ;
  static const int CONSTANT_ID_UOM_METERS = 2 ;
  static const int CONSTANT_ID_DOCUMENT_CATEGORY_STAFF = 1 ;
  static const int CONSTANT_ID_RRSITE_CDS_MP_SITE = 4 ;

  /* Access Control */
  static const String METHOD_CODE_ACCESS_LIST = "listCodeAccess";
  static const String METHOD_CODE_ACCES_ADD = "addCodeAccess";
  static const String METHOD_CODE_ACCES_PERMANENT_DELETE = "permanentDeleteCodeAccess";
  static const String METHOD_CODE_ACCES_UPDATE = "updateCodeAccess";

  static const String KEY_RESULT_SUCCESS = "Init/initiator" ;
//  static const String KEY_DONT_PERFORM_SECURITY_CHECK = "dontPerformSecCheck" ;
  /* RRSitesl */
  static const  String METHOD_RRSITES_LU_LIST = "listRRSites";


  /* Generic sync SQL */
  static const  String METHOD_GENERIC_SYNC_SQL = "genericSyncSQL";

  /* Staff */
  static const  String METHOD_STAFF_DEPARTMENT_LIST = "liststaffDepartment";

  /* Material Group */
  static const  String METHOD_MATERIAL_GROUP_ADD = "addMaterialGroup";
  static const  String METHOD_MATERIAL_GROUP_LIST = "materialGroup";
  static const  String METHOD_MATERIAL_GROUP_LIST_PER_SUPPLIER = "materialGroupPerSupplier";
  static const  String METHOD_MATERIAL_GROUP_PERMANENT_DELETE = "permanentDeleteMaterialGroup";
  static const  String METHOD_MATERIAL_GROUP_UPDATE = "updateMaterialGroup";
  static const  String METHOD_MATERIAL_GROUP_SET_INACTIVE = "deActivateMaterialGroup";
  static const  String METHOD_MATERIAL_GROUP_SET_ACTIVE = "reActivateMaterialGroup";

  /* Suppliers */
  static const  String METHOD_SUPPLIERS_ADD = "addSuppliers";
  static const  String METHOD_SUPPLIERS_PERMANENT_DELETE = "permanentDeleteSuppliers";
  static const  String METHOD_SUPPLIERS_LIST= "listSuppliers";
  static const  String METHOD_SUPPLIERS_UPDATE = "updateSuppliers";
  static const  String METHOD_SUPPLIERS_SET_INACTIVE = "deActivateSuppliers";
  static const  String METHOD_SUPPLIERS_SET_ACTIVE = "reActivateSuppliers";
  static const  String METHOD_SUPPLIERS_LIST_BY_MAT_GROUP = "listSuppliersByMaterialGroup";

  /* Products */
  static const  String METHOD_PRODUCTS_ADD = "addProducts";
  static const  String METHOD_PRODUCTS_LIST = "listProducts";
  static const  String METHOD_PRODUCTS_UPDATE  = "updateProducts";
  static const  String METHOD_PRODUCTS_DELETE = "deleteProducts";
  static const  String METHOD_PRODUCTS_SET_INACTIVE = "deActivateProducts";
  static const  String METHOD_PRODUCTS_SET_ACTIVE = "reActivateProducts";
  static const  String METHOD_PRODUCTS_ADD_FROM_SEARCH_TOOL = "addProductsFromSearch";
  static const  String METHOD_PRODUCTS_UPDATE_FROM_SEARCH_TOOL = "updateProductsFromSearch";
  static const  String METHOD_PRODUCTS_UPDATE_FLAGSONLY_SEARCH_TOOL = "updateProductsFlagOnlyFromSearch";

  /* Cable drums */
  static const  String METHOD_CABLE_DRUMS_LIST = "listCableDrums";
  static const  String METHOD_CABLE_DRUMS_UPDATE  = "updateCableDrums";
  static const  String METHOD_CABLE_DRUMS_INVOICE_UPDATE  = "invoiceUpdateCableDrums";

}