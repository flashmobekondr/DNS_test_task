import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dnstestapi/model.dart';

Future<Token> requestTokenAPI(PersonalData data) async {

  Map <String, String> bodyMap = {
    'firstName' : '${data.name}',
    'lastName' : '${data.surname}',
    'phone' : '${data.phone}',
    'email' : '${data.email}'
  };

  Map<String,String> headers = {
    'Content-type' : 'application/json',
    'Accept': 'application/json',
  };

  final String url = 'https://vacancy.dns-shop.ru/api/candidate/token';
  var body = json.encode(bodyMap);

  final response = await http.post(url, body: body, headers: headers);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if(response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return Token.fromJson(responseJson);
  }
  else {
    throw Exception('error fetching data');
  }
}

Future<ApprovedData> sendDataAPI(PersonalData data) async {

  Map<String, String> bodyMap = {
    "firstName": "${data.name}",
    "lastName": "${data.surname}",
    "phone": "${data.phone}",
    "email": "${data.email}",
    "githubProfileUrl": "${data.github}",
    "summary": "${data.resume}"

  };

  Map<String, String> headers = {
    'Content-type' : 'application/json',
    'Authorization': 'Bearer ${data.token}',
  };

  final String url = 'https://vacancy.dns-shop.ru/api/candidate/test/summary';
  var body = json.encode(bodyMap);

  final response = await http.post(url, body: body, headers: headers);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  if(response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return ApprovedData.fromJson(responseJson);
  }
  else {
    throw Exception('error fetching data');
  }

}