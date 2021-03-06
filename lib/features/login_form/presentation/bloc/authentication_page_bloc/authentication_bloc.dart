import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/has_token.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final HasToken token;
  AuthenticationBloc({this.token}) : assert(token != null);
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = token.has();
      print(hasToken);

      if(hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    }
    /*if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }*/
  }
}
