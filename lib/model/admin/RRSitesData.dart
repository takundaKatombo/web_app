class RRSitesData {

  int constant_id;
  String rrsite_id;
  String site_name;
  String active;
  String username;
  String latitude;
  String longitude;


  RRSitesData({ this.constant_id, this.rrsite_id,this.site_name, this.active,
              this.username, this.latitude,this.longitude
              }) {
  }

  Map<String, dynamic> toJson() =>
      {
        'constant_id': constant_id,
        'rrsite_id': rrsite_id,
        'site_name': site_name,
        'active': active,
        'username': username,
        'latitude': latitude,
        'longitude': longitude
      };

  factory RRSitesData.fromJson(Map<String, dynamic> json) {
    return RRSitesData(
      constant_id: json['constant_id'],
      rrsite_id: json['rrsite_id'],
      site_name: json['site_name'],
      active: json['active'],
      username: json['username'],
      latitude: json['latitude'],
      longitude: json['longitude']
    );
  }
}
