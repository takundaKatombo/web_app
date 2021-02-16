class UOMData {

  String uom_id;
  String uom_name;
  String description;
  String active;
  String username;
  String symbol;
  String purpose;
  int constant_id;


  UOMData({ this.uom_id, this.uom_name,this.description, this.active,
    this.username, this.symbol,this.purpose, this.constant_id
  }) {
  }
  Map<String, dynamic> toJson() =>
      {
        'uom_id': uom_id,
        'uom_name': uom_name,
        'description': description,
        'active': active,
        'username': username,
        'symbol': symbol,
        'purpose': purpose,
        'constant_id': constant_id,

      };

  factory UOMData.fromJson(Map<String, dynamic> json) {
    return UOMData(
      uom_id: json['uom_id'],
      uom_name: json['uom_name'],
      description: json['description'],
      active: json['active'],
      username: json['username'],
      symbol: json['symbol'],
      purpose: json['purpose'],
      constant_id: json['constant_id']

    );
  }
}
