import 'package:dnstestapi/features/login_form/presentation/pages/first_screen.dart';
import 'package:dnstestapi/features/login_form/presentation/pages/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dnstestapi/injection_container.dart';
import 'package:dnstestapi/features/login_form/presentation/pages/splash_screen.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/authentication_page_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/first_page_login_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/second_page_login_bloc/bloc.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUninitialized) {
          return SplashScreen();
        }
        if (state is AuthenticationUnauthenticated) {
          return BlocProvider<FirstPageBloc>(
            create: (context) => sl<FirstPageBloc>(),
            child: FirstPage(),
          );
        }
        if (state is AuthenticationAuthenticated) {
          return BlocProvider<SecondPageBloc>(
            create: (context) => sl<SecondPageBloc>(),
            child: SecondPage(),
          );
        }
      },
    );
  }
}
