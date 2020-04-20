import 'package:equatable/equatable.dart';

abstract class SecondPageEvent extends Equatable {
  const SecondPageEvent();
  @override
  List<Object> get props => [];
}
class GithubChanged extends SecondPageEvent {
  final String github;
  GithubChanged({this.github});

  @override
  List<Object> get props => [github];

  @override
  String toString() => 'GithubChanged: {github: $github}';
}

class ResumeChanged extends SecondPageEvent {
  final String resume;
  ResumeChanged({this.resume});

  @override
  List<Object> get props => [resume];

  @override
  String toString() => 'ResumeChanged: {resume: $resume}';
}

class FormSubmittedSecond extends SecondPageEvent {}