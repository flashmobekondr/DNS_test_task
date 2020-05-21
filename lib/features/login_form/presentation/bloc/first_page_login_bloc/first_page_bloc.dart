import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/get_token.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/validate_data.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/authentication_page_bloc/authentication_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';


class FirstPageBloc extends Bloc<FirstPageEvent, FirstPageState> {
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
  FirstPageState get initialState => FirstValidateState.initial();

  @override
  Stream<FirstPageState> mapEventToState(
    FirstPageEvent event,
  ) async* {
    final currentState = state;
    if (currentState is FirstValidateState) {
      if (event is NameChanged) {
        yield currentState.copyWith(
            name: event.name,
            isNameValid: validate.nameOrSurname(event.name)
        );
      }
      if (event is SurnameChanged) {
        yield currentState.copyWith(
            surname: event.surname,
            isSurnameValid: validate.nameOrSurname(event.surname)
        );
      }
      if (event is EmailChanged) {
        yield currentState.copyWith(
            email: event.email,
            isEmailValid: validate.email(event.email)
        );
      }
      if (event is PhoneChanged) {
        yield currentState.copyWith(
            phone: event.phone,
            isPhoneValid: validate.phone(event.phone)
        );
      }
      if (event is FormSubmittedFirst) {
//      print('${state.name}');
        //final currentState= state;

        yield LoadingStateFirst();
        try {
          final result = await getToken.get(
              currentState.name,
              currentState.surname,
              currentState.email,
              currentState.phone
          );
          await sharedPreferences.setString('CACHED_TOKEN', result.data);
          event.authenticationBloc.add(LoggedIn());
        } catch(e) {
          yield currentState.copyWith(isError: true);
        }
      }
    }
  }
}
