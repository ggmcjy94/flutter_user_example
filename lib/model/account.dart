

class SignInParams {
  String? email;
  String? password;

  SignInParams({this.email, this.password});
}

class SignUpParams {
  String? email;
  String? password;
  String? username;
  String? tel;

  SignUpParams({this.email, this.password, this.username, this.tel});
}

class LoginToken{
  String? email;
  String? username;
  String? accessToken;
  String? refreshToken;


  LoginToken({this.email, this.username, this.accessToken, this.refreshToken});

  factory LoginToken.fromJson(Map<dynamic, dynamic> json) => LoginToken (
    email : json["email"],
    username : json["username"],
    accessToken : json["accessToken"],
    refreshToken : json["refreshToken"],
  );
}