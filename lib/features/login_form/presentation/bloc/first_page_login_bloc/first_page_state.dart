import 'package:equatable/equatable.dart';
abstract class FirstPageState extends Equatable {
  const FirstPageState();

  @override
  List<Object> get props => [];
}

class FirstValidateState extends FirstPageState {
  final String name;
  final bool isNameValid;
  final String surname;
  final bool isSurnameValid;
  final String email;
  final bool isEmailValid;
  final String phone;
  final bool isPhoneValid;
  final bool isError;

  bool get isFormValid =>  isNameValid &&
                          isSurnameValid &&
                          isEmailValid &&
                          isPhoneValid;

  FirstValidateState({
    this.name,
    this.isNameValid,
    this.surname,
    this.isSurnameValid,
    this.email,
    this.isEmailValid,
    this.phone,
    this.isPhoneValid,
    this.isError
});

  factory FirstValidateState.initial() {
    return FirstValidateState(
      name: '',
      isNameValid: false,
      surname: '',
      isSurnameValid: false,
      email: '',
      isEmailValid: false,
      phone: null,
      isPhoneValid: false,
      isError: false
    );
  }

  FirstValidateState copyWith ({
     String name,
     bool isNameValid,
     String surname,
     bool isSurnameValid,
     String email,
     bool isEmailValid,
     String phone,
     bool isPhoneValid,
     bool isError
}) {
    return FirstValidateState(
      name: name ?? this.name,
      isNameValid: isNameValid ?? this.isNameValid,
      surname: surname ?? this.surname,
      isSurnameValid: isSurnameValid ?? this.isSurnameValid,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      phone: phone ?? this.phone,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isError: isError ?? this.isError
    );
}

  @override
  List<Object> get props => [
    name,
    isNameValid,
    surname,
    isSurnameValid,
    email,
    isEmailValid,
    phone,
    isPhoneValid,
    isError

  ];

  @override
  String toString() {
    return '''ValidateState {
    name: $name,
    isNameValid: $isNameValid,
    surname: $surname,
    isSurnameValid: $isSurnameValid,
    email: $email,
    isEmailValid: $isEmailValid,
    phone: $phone,
    isPhoneValid: $isPhoneValid,
    isError: $isError
    }''';
  }
}

class LoadingStateFirst extends FirstPageState {}

