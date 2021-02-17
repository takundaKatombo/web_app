class StaffDepartmentData
{

  String department_id ;
  String department_name ;
  String active ;
  String username ;
  int constant_id ;

  StaffDepartmentData({this.department_id,this.department_name,this.active , this.username, this.constant_id });

  Map<String, dynamic> toJson() =>
      {
        'department_id': department_id,
        'department_name': department_name,
        'active': active,
        'username': username,
        'constant_id': constant_id
      };

//  StaffDepartmentData.fromJson(Map<String, dynamic> json)
 //     : department_id = json['department_id'],
   //     department_name = json['department_name'],
    //    active = json['active'],
     //   username = json['username'],
      //  constant_id = json['constant_id'];

  /*
  factory StaffDepartmentData.fromJson(Map<String, dynamic> json) {
    return StaffDepartmentData(
        department_id : json['department_id'],
        department_name : json['department_name'],
        active : json['active'],
        username : json['username'],
        constant_id : json['constant_id']
    );
    */
  factory StaffDepartmentData.fromJsonToList(Map<String, dynamic> json) {
    //return List<StaffDepartmentData> departList = json['entityElements'];
   // List<StaffDepartmentData> list = json['entityElements'] as List;
    var list = json['entityElements'] as List;

    List<StaffDepartmentData> itemsList = list.map((i) => StaffDepartmentData.fromJson(i)).toList();
    //return itemsList ;
  }

  factory StaffDepartmentData.fromJson(Map<String, dynamic> json) {
   // List<StaffDepartmentData> departList = json['entityElements'];

    return StaffDepartmentData(
        department_id : json['department_id'] as String,
        department_name : json['department_name'] as String,
        active : json['active'] as String,
        username : json['username'] as String,
        constant_id : json['constant_id'] as int,
      // Return
       // items: itemsList
    );

  }


  /*
  var list = YoutubeResponseJson['items'] as List;
  List<Item> itemsList = list.map((i) => Item.fromJSON(i)).toList();

  return new YoutubeResponse(
  kind: YoutubeResponseJson['kind'],
  etag: YoutubeResponseJson['etag'],
  nextPageToken: YoutubeResponseJson['nextPageToken'],
  regionCode: YoutubeResponseJson['regionCode'],
  mPageInfo: pageInfo.fromJSON(YoutubeResponseJson['pageInfo']),

  // Here we are returning parsed JSON Array.

  items: itemsList);
*/
}

