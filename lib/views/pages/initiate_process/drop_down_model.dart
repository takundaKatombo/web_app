class StateModel {
  String site;
  String mainproject;
  List<String> schedule;
  List<String> subproject;

  StateModel({this.site, this.mainproject, this.schedule, this.subproject});

  StateModel.fromJson(Map<String, dynamic> json) {
    site = json['site'];
    mainproject = json['mainproject'];
    subproject = json['subproject'].cast<String>();
    schedule = json['schedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site'] = this.site;
    data['mainproject'] = this.mainproject;
    data['schedule'] = this.schedule;
    data['subproject'] = this.subproject;
    return data;
  }
}
