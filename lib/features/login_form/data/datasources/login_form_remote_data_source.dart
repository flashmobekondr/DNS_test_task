import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dnstestapi/features/login_form/data/model/login_form_token_model.dart';


abstract class LoginFormRemoteDataSource {
  Future<TokenModel> getToken(
      String name,
      String surname,
      String email,
      String phone
      );
  Future<TokenModel> sendPersonal(
      String github,
      String resume
      );
}

class LoginFormRemoteDataSourceImpl implements LoginFormRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  LoginFormRemoteDataSourceImpl({this.client,this.sharedPreferences});

  @override
  Future<TokenModel> getToken(
      String name,
      String surname,
      String email,
      String phone) async {
   /* print('$name');
    print('$surname');
    print('$email');
    print('$phone');*/

    await sharedPreferences.setString('CACHED_NAME', name);
    await sharedPreferences.setString('CACHED_SURNAME', surname);
    await sharedPreferences.setString('CACHED_EMAIL', email);
    await sharedPreferences.setString('CACHED_PHONE', phone);

    Map <String, String> bodyMap = {
      'firstName' : '$name',
      'lastName' : '$surname',
      'phone' : '$phone',
      'email' : '$email'
    };

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    final String url = 'https://vacancy.dns-shop.ru/api/candidate/token';
    var body = json.encode(bodyMap);

    final response = await client.post(url, body: body, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if(response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return TokenModel.fromJson(responseJson);
    }
    else {
      throw Exception('error fetching data');
    }
  }

  @override
  Future<TokenModel> sendPersonal(
      String github,
      String resume) async {

    final String token = sharedPreferences.getString('CACHED_TOKEN');
    final String name = sharedPreferences.getString('CACHED_NAME');
    final String surname  = sharedPreferences.getString('CACHED_SURNAME');
    final String email  = sharedPreferences.getString('CACHED_EMAIL');
    final String phone  = sharedPreferences.getString('CACHED_PHONE');

    Map<String, String> bodyMap = {
      "firstName": "$name",
      "lastName": "$surname",
      "phone": "$phone",
      "email": "$email",
      "githubProfileUrl": "$github",
      "summary": "$resume"

    };

    Map<String, String> headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token',
    };

    final String url = 'https://vacancy.dns-shop.ru/api/candidate/test/summary';
    var body = json.encode(bodyMap);

    final response = await client.post(url, body: body, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if(response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return TokenModel.fromJson(responseJson);
    }
    else {
      throw Exception('error fetching data');
    }
  }

}