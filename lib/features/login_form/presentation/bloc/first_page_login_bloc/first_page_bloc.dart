import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/get_token.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/validate_data.dart';
import 'package:dnstestapi/features/login_form/domain/entities/token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';


class FirstPageBloc extends Bloc<FirstPageEvent, FirstValidateState> {
  final Validate validate;
  final GetToken getToken;
  final SharedPreferences sharedPreferences;
  FirstPageBloc({
    this.validate,
    this.getToken,
    this.sharedPreferences
}) : assert(validate!=null),
    assert(getToken !=null),
    assert(sharedPreferences != null);

  @override
  FirstValidateState get initialState => FirstValidateState.initial();

  @override
  Stream<FirstValidateState> mapEventToState(
    FirstPageEvent event,
  ) async* {
    if (event is NameChanged) {
      yield state.copyWith(
        name: event.name,
        isNameValid: validate.interactor.isNameOrSurnameValid(event.name)
      );
    }
    if (event is SurnameChanged) {
      yield state.copyWith(
        surname: event.surname,
        isSurnameValid: validate.interactor.isNameOrSurnameValid(event.surname)
      );
    }
    if (event is EmailChanged) {
      yield state.copyWith(
        email: event.email,
        isEmailValid: validate.interactor.isEmailValid(event.email)
      );
    }
    if (event is PhoneChanged) {
      yield state.copyWith(
        phone: event.phone,
        isPhoneValid: validate.interactor.isPhoneValid(event.phone)
      );
    }
    if (event is FormSubmittedFirst) {
//      print('${state.name}');
      final currentState= state;

      yield LoadingStateFirst();
      try {
        final result = await getToken.get(
            currentState.name,
            currentState.surname,
            currentState.email,
            currentState.phone
        );

        await sharedPreferences.setString('CACHED_TOKEN', result.data);
      } catch(e) {
        yield ErrorStateFirst();
      }
      yield MoveToNextScreenState();
    }
  }
}
