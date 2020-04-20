import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/send_personal.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/validate_data.dart';
import 'package:dnstestapi/features/login_form/domain/entities/token.dart';


class SecondPageBloc extends Bloc<SecondPageEvent, ValidateStateSecond> {
  final Validate validate;
  final SendPersonal sendPersonal;
  final SharedPreferences sharedPreferences;
  SecondPageBloc({
   this.validate,
   this.sendPersonal,
   this.sharedPreferences
});

  @override
  ValidateStateSecond get initialState => ValidateStateSecond.initial();

  @override
  Stream<ValidateStateSecond> mapEventToState(
    SecondPageEvent event,
  ) async* {
    if (event is GithubChanged) {
      yield state.copyWith(
        github: event.github,
        isGithubValid: validate.interactor.isUrlValid(event.github)
      );
    }
    if (event is ResumeChanged) {
      yield state.copyWith(
        resume: event.resume,
        isResumeValid: validate.interactor.isUrlValid(event.resume)
      );
    }
    if (event is FormSubmittedSecond) {
      final currentState = state;
      yield LoadingStateSecond();
      try {
        final result = await sendPersonal.send(
            currentState.github,
            currentState.resume);
      } catch(e) {
        yield ErrorStateSecond();
      }
      yield DataSentState();
    }
  }
}
