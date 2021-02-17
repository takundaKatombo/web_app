class MaterialGroupLuData {

  int constant_id;
  String mat_group_id;
  String group_name;
  String active;
  String username;
  String description;
  bool checked ;

  MaterialGroupLuData({ this.constant_id, this.mat_group_id,this.group_name, this.active,
    this.username, this.description,this.checked
  }) {
  }
  Map<String, dynamic> toJson() =>
      {
        'constant_id': constant_id,
        'mat_group_id': mat_group_id,
        'group_name': group_name,
        'active': active,
        'username': username,
        'description': description,
        'checked': checked
      };

  factory MaterialGroupLuData.fromJson(Map<String, dynamic> json) {
    return MaterialGroupLuData(
        constant_id: json['constant_id'],
        mat_group_id: json['mat_group_id'],
        group_name: json['group_name'],
        active: json['active'],
        username: json['username'],
        description: json['description'],
        checked: json['checked']
    );
  }
}
