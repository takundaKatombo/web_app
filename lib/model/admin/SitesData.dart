class SitesData {

  int site_id ;
  int master_site_id ;
  String site_name ;
  String machine_name ;
  String master_machine_name ;
  String site_tel ;
  String site_admin_id ;

  String sync_up_stats ;
  String sync_down_stats ;

  String last_up_sync ;
  String last_down_sync ;

  int last_used_seq ;
  String active ;


  SitesData({
    this.site_id = -1, this.master_site_id = -1 , this.site_name = '', this.machine_name = '',
    this.master_machine_name = '', this.site_tel = '', this.site_admin_id = '', this.sync_up_stats = '',
    this.sync_down_stats = '', this.last_up_sync = '', this.last_down_sync = '', this.last_used_seq ,
    this.active = ''
    }
    ) ;


  Map<String, dynamic> toJson() =>
      {
        'site_id': site_id,
        'master_site_id': master_site_id,
        'site_name': site_name,
        'machine_name': machine_name,
        'master_machine_name': master_machine_name,
        'site_tel': site_tel,
        'site_admin_id': site_admin_id,
        'sync_up_stats': sync_up_stats,
        'sync_down_stats': sync_down_stats,
        'last_up_sync': last_up_sync,
        'last_down_sync': last_down_sync,
        'last_used_seq': last_used_seq,
        'active': active
      };

  factory SitesData.fromJson(Map<String, dynamic> json) {
    return SitesData(
      site_id: json['site_id'],
      master_site_id: json['master_site_id'],
      site_name: json['site_name'],
      machine_name: json['machine_name'],
      master_machine_name: json['master_machine_name'],
      site_tel: json['site_tel'],
      site_admin_id: json['site_admin_id'],
      sync_up_stats: json['sync_up_stats'],
      sync_down_stats: json['sync_down_stats'],
      last_up_sync: json['last_up_sync'],
      last_down_sync: json['last_down_sync'],
      last_used_seq: json['last_used_seq'],
      active: json['active']
    );
  }
}
