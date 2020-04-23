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

  bool get isFormValid => isGithubValid && isResumeValid;

  ValidateStateSecond({
   this.github,
   this.isGithubValid,
   this.resume,
   this.isResumeValid
});

  factory ValidateStateSecond.initial() {
    return ValidateStateSecond(
        github: '',
        isGithubValid: false,
        resume: '',
        isResumeValid: false,
    );
  }

  ValidateStateSecond copyWith ({
    String github,
    bool isGithubValid,
    String resume,
    bool isResumeValid,
}) {
    return ValidateStateSecond(
      github: github ?? this.github,
      isGithubValid: isGithubValid ?? this.isGithubValid,
      resume: resume ?? this.resume,
      isResumeValid: isResumeValid ?? this.isResumeValid,
    );
  }

  @override
  List<Object> get props => [
    github,
    isGithubValid,
    resume,
    isResumeValid,
  ];

  @override
  String toString() {
    return '''ValidateState {
    github: $github,
    isGithubValid: $isGithubValid,
    resume: $resume,
    isResumeValid: $isResumeValid,
    }''';
  }
}

class DataSentState extends SecondStatePage {}
class LoadingStateSecond extends SecondStatePage {}
class ErrorStateSecond extends SecondStatePage {}
