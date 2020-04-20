class Token {
  final String token;
  final int code;
  final String message;

  Token({this.token,this.code,this.message});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['data'],
      code: json['code'],
      message: json['message'],
    );
  }
}

class ApprovedData {
  final String data;
  final String message;
  final int code;

  ApprovedData({this.data,this.message,this.code});

  factory ApprovedData.fromJson(Map<String, dynamic> json) {
    return ApprovedData(
      data: json['data'],
      message: json['message'],
      code: json['code'],
    );
  }
}

class PersonalData {
  final String name;
  final String surname;
  final String phone;
  final String email;

  final String token;

  final String github;
  final String resume;


  PersonalData({this.name,this.surname,this.phone,this.email,this.token,this.github,this.resume});
}