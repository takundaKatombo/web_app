
import 'package:web_app/model/stock/MaterialGroupLuData.dart';

class SuppliersData {

  String supplier_id;
  String contact_name;
  String tel_no;
  String active;
  String username;
  String email_address;
  String address;
  String supplier_name;
  List<MaterialGroupLuData> material_group_list;

  SuppliersData({ this.supplier_id, this.contact_name,this.tel_no, this.active,
    this.username, this.email_address,this.address, this.supplier_name, this.material_group_list
  }) {
  }
  Map<String, dynamic> toJson() =>
      {
        'supplier_id': supplier_id,
        'contact_name': contact_name,
        'tel_no': tel_no,
        'active': active,
        'username': username,
        'email_address': email_address,
        'address': address,
        'supplier_name': supplier_name,
        'material_group_list': material_group_list
      };

  factory SuppliersData.fromJson(Map<String, dynamic> json) {
    return SuppliersData(
        supplier_id: json['supplier_id'],
        contact_name: json['contact_name'],
        tel_no: json['tel_no'],
        active: json['active'],
        username: json['username'],
        email_address: json['email_address'],
        address: json['address'],
        supplier_name: json['supplier_name'],
        material_group_list: json['material_group_list']
    );
  }
}
