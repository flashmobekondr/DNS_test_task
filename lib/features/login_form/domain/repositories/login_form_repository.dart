import 'package:dnstestapi/features/login_form/domain/entities/token.dart';

abstract class LoginFormRepository {
  Future<Token1> getToken(
      String name,
      String surname,
      String email,
      String phone
      );
  Future<Token1> sendPersonal(
      String github,
      String resume
      );
}