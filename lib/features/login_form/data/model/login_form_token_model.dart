import 'package:dnstestapi/features/login_form/domain/entities/token.dart';

class TokenModel extends Token1 {
  TokenModel({
    String data,
    int code,
    String message,
  }): super(data:data, code: code, message: message);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      data: json['data'],
      code: json['code'],
      message: json['message'],
    );
  }
}