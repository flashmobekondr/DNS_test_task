import 'package:dnstestapi/features/login_form/domain/repositories/login_form_repository.dart';

class HasToken {
  final LoginFormRepository repository;
  HasToken({this.repository});

  bool has () {
    try {
      return repository.hasToken();
    } catch (e) {
      throw Exception('error fetching data');
    }
  }
}