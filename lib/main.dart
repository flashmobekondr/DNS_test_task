import 'package:dnstestapi/features/login_form/presentation/bloc/authentication_page_bloc/authentication_bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/authentication_page_bloc/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/first_page_login_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/pages/first_screen.dart';
import 'package:dnstestapi/features/login_form/presentation/pages/authentication_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => di.sl<AuthenticationBloc>()..add(AppStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange
        ),
        home: AuthenticationPage(),
      ),
    );
  }
}


