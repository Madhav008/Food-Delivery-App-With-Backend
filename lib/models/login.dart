class Login {
  String accessToken;
  String tokenType;
  String expireAt;

  Login({this.accessToken, this.tokenType, this.expireAt});

  Login.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    expireAt = json['expireAt'];
  }
}

