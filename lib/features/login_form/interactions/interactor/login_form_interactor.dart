class LoginFormInteractor {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _phoneRegExp = RegExp(
      r'^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$');
  final RegExp _urlRegExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}'
      r'\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
  );

  bool isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
    //return true;
  }
  bool isPhoneValid(String phone) {
    return _phoneRegExp.hasMatch(phone);
    //return true;
  }
  bool isUrlValid(String url) {
    return _urlRegExp.hasMatch(url);
    //return true;
  }
  bool isNameOrSurnameValid(String name) {
    //Need RegExp for russian
    return true;
  }
}