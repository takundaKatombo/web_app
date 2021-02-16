class StockLocationData {

  String stock_loc_id ;
  String location_name ;
  String store ;
  String active ;
  String username ;
  String aisle ;
  String rack ;
  String code ;
  String site_id ;
  // Info of FK's only
  String site_name ;//=  CMS3_GUI.config.FKFieldNotice ;

  StockLocationData({ this.stock_loc_id, this.location_name,this.store, this.active,
    this.username, this.aisle,this.rack, this.code, this.site_id,this.site_name
  }) {
  }
  Map<String, dynamic> toJson() =>
      {
        'stock_loc_id': stock_loc_id,
        'location_name': location_name,
        'store': store,
        'active': active,
        'username': username,
        'aisle': aisle,
        'rack': rack,
        'code': code,
        'site_id': site_id,
        'site_name': site_name

      };

  factory StockLocationData.fromJson(Map<String, dynamic> json) {
    return StockLocationData(
        stock_loc_id: json['stock_loc_id'],
        location_name: json['location_name'],
        store: json['store'],
        active: json['active'],
        username: json['username'],
        aisle: json['aisle'],
        rack: json['rack'],
        code: json['code'],
        site_id: json['site_id'],
        site_name: json['site_name']
    );
  }
}
