import 'package:flutter/material.dart';
import 'Pages/InputDataPage.dart';
import 'Pages/SendDataPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DNS Test task',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputForm(),
        '/sendForm': (context) => SendData(),
      },
    );
  }
}

