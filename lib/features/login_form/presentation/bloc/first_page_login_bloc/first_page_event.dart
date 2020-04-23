import 'package:dnstestapi/features/login_form/presentation/bloc/authentication_page_bloc/authentication_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class FirstPageEvent extends Equatable {
  const FirstPageEvent();
  @override
  List<Object> get props => [];
}
class NameChanged extends FirstPageEvent {
  final String name;
  NameChanged({this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'NameChanged: {name: $name}';
}

class SurnameChanged extends FirstPageEvent {
  final String surname;
  SurnameChanged({this.surname});

  @override
  List<Object> get props => [surname];

  @override
  String toString() => 'SurnameChanged: {surname: $surname}';
}

class EmailChanged extends FirstPageEvent {
  final String email;
  EmailChanged({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged: {email: $email}';
}

class PhoneChanged extends FirstPageEvent {
  final String phone;
  PhoneChanged({this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() => 'PhoneChanged: {phone: $phone}';
}

class FormSubmittedFirst extends FirstPageEvent {
  final AuthenticationBloc authenticationBloc;
  FormSubmittedFirst({this.authenticationBloc});

  @override
  List<Object> get props => [authenticationBloc];
}