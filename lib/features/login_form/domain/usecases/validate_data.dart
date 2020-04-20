import 'package:dnstestapi/features/login_form/interactions/interactor/login_form_interactor.dart';

class Validate {
  final LoginFormInteractor interactor;
  Validate({this.interactor});

  bool phone(String phone) {
    return interactor.isPhoneValid(phone);
  }
  bool url(String url) {
    return interactor.isUrlValid(url);
  }
  bool email(String email) {
    return interactor.isEmailValid(email);
  }
  bool nameOrSurname(String name) {
    return interactor.isNameOrSurnameValid(name);
  }
}