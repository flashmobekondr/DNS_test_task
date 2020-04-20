import 'package:dnstestapi/features/login_form/domain/entities/token.dart';
import 'package:dnstestapi/features/login_form/domain/repositories/login_form_repository.dart';
import 'package:equatable/equatable.dart';

class GetToken {
  final LoginFormRepository repository;

  GetToken({this.repository});

  Future<Token1> get(
      String name,
      String surname,
      String email,
      String phone
      ) async {
    try {
      print('$name');
      print('$surname');

      return await repository.getToken(
          name,
          surname,
          email,
          phone
      );
    } catch(e) {
      throw Exception('error fetching data');
    }
  }
}

