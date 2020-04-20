import 'package:dnstestapi/features/login_form/domain/entities/token.dart';
import 'package:dnstestapi/features/login_form/domain/repositories/login_form_repository.dart';
import 'package:equatable/equatable.dart';

class SendPersonal {
  final LoginFormRepository repository;

  SendPersonal({this.repository});

  Future<Token1> send(
      String github,
      String resume
      ) async {
    try {
      return await repository.sendPersonal(
          github,
          resume
      );
    } catch(e) {
      throw Exception('error fetching data');
    }
  }

}