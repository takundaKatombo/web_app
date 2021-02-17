class ResultObject {

  bool resultSuccess;

  String resultDescription;

  ResultObject({ this.resultSuccess = false, this.resultDescription = '' }) {
  }

  Map<String, dynamic> toJson() =>
      {
        'resultSuccess': resultSuccess,
        'resultDescription': resultDescription
      };

  factory ResultObject.fromJson(Map<String, dynamic> json) {
    return ResultObject(
        resultSuccess: json['resultSuccess'],
        resultDescription: json['resultDescription']
    );
  }
}
