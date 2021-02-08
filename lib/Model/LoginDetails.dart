class LoginDetails {

  int userID ;
  String userName ;
  String firstName ;
  String lastName ;
  String password ;
  String currentState ; //'loggedOut'
  String loginStatus ;
  String resultDescription ;
  String defaultRole ;
  String clientIPAddress ;
  String remoteIp ; //= "IpNotSet."
  List<String> roles ;
  bool connected ;



  LoginDetails({
    this.userID = -1, this.userName , this.firstName, this.lastName,
    this.password = '', this.currentState = '', this.loginStatus = '', this.resultDescription = '',
    this.defaultRole = '', this.clientIPAddress = '', this.remoteIp = '', this.roles,this.connected = false
  }
      ) ;


  Map<String, dynamic> toJson() =>
      {
        'userID': userID,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'currentState': currentState,
        'loginStatus': loginStatus,
        'resultDescription': resultDescription,
        'defaultRole': defaultRole,
        'clientIPAddress': clientIPAddress,
        'remoteIp': remoteIp,
        'roles': roles,
        'connected': connected
      };

  factory LoginDetails.fromJson(Map<String, dynamic> json) {
    return LoginDetails(
        userID: json['userID'],
        userName: json['userName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        currentState: json['currentState'],
        loginStatus: json['loginStatus'],
        resultDescription: json['resultDescription'],
        defaultRole: json['defaultRole'],
        clientIPAddress: json['clientIPAddress'],
        remoteIp: json['remoteIp'],
        roles: json['roles'],
        connected: json['connected']
    );
  }
}
