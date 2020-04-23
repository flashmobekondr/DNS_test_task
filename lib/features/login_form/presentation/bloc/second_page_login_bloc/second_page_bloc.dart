import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/send_personal.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/validate_data.dart';
import 'package:dnstestapi/features/login_form/domain/entities/token.dart';


class SecondPageBloc extends Bloc<SecondPageEvent, SecondStatePage> {
  final Validate validate;
  final SendPersonal sendPersonal;
  final SharedPreferences sharedPreferences;
  SecondPageBloc({
   this.validate,
   this.sendPersonal,
   this.sharedPreferences
}) : assert(validate != null),
    assert(sendPersonal != null);

  @override
  SecondStatePage get initialState => ValidateStateSecond.initial();

  @override
  Stream<SecondStatePage> mapEventToState(
    SecondPageEvent event,
  ) async* {
    final currentState = state;
    if (currentState is ValidateStateSecond) {
      if (event is GithubChanged) {
        yield currentState.copyWith(
            github: event.github,
            isGithubValid: validate.url(event.github)
        );
      }
      if (event is ResumeChanged) {
        yield currentState.copyWith(
            resume: event.resume,
            isResumeValid: validate.url(event.resume)
        );
      }
      if (event is FormSubmittedSecond) {
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
}
