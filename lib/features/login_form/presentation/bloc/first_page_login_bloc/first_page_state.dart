import 'package:equatable/equatable.dart';

class FirstValidateState extends Equatable {
  final String name;
  final bool isNameValid;
  final String surname;
  final bool isSurnameValid;
  final String email;
  final bool isEmailValid;
  final String phone;
  final bool isPhoneValid;

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
    this.isPhoneValid
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
      isPhoneValid: false
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
}) {
    return FirstValidateState(
      name: name ?? this.name,
      isNameValid: isNameValid ?? this.isNameValid,
      surname: surname ?? this.surname,
      isSurnameValid: isSurnameValid ?? this.isSurnameValid,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      phone: phone ?? this.phone,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid
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
    isPhoneValid: $isPhoneValid
    }''';
  }
}

class MoveToNextScreenState extends FirstValidateState {}
class LoadingStateFirst extends FirstValidateState {}
class ErrorStateFirst extends FirstValidateState {}
