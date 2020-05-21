import 'package:equatable/equatable.dart';

abstract class SecondStatePage extends Equatable {
  const SecondStatePage();

  @override
  List<Object> get props => [];
}

class ValidateStateSecond extends SecondStatePage {
  final String github;
  final bool isGithubValid;
  final String resume;
  final bool isResumeValid;
  final bool isError;

  bool get isFormValid => isGithubValid && isResumeValid;

  ValidateStateSecond({
   this.github,
   this.isGithubValid,
   this.resume,
   this.isResumeValid,
    this.isError
});

//  factory ValidateStateSecond.initial() {
//    return ValidateStateSecond(
//        github: '',
//        isGithubValid: false,
//        resume: '',
//        isResumeValid: false,
//    );
//  }
  ValidateStateSecond.initial():
        github='',
        isGithubValid=false,
        resume = '',
        isResumeValid = false,
        isError = false;

  ValidateStateSecond copyWith ({
    String github,
    bool isGithubValid,
    String resume,
    bool isResumeValid,
    bool isError
}) {
    return ValidateStateSecond(
      github: github ?? this.github,
      isGithubValid: isGithubValid ?? this.isGithubValid,
      resume: resume ?? this.resume,
      isResumeValid: isResumeValid ?? this.isResumeValid,
      isError: isError ?? this.isError
    );
  }

  @override
  List<Object> get props => [
    github,
    isGithubValid,
    resume,
    isResumeValid,
    isError
  ];

  @override
  String toString() {
    return '''ValidateState {
    github: $github,
    isGithubValid: $isGithubValid,
    resume: $resume,
    isResumeValid: $isResumeValid,
    isError: $isError
    }''';
  }
}

class DataSentState extends SecondStatePage {}
class LoadingStateSecond extends SecondStatePage {}
class ErrorStateSecond extends SecondStatePage {}
