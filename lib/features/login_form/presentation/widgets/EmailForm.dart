import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  final TextEditingController emailController;
  final bool isEmailValid;
  EmailForm({this.emailController,this.isEmailValid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        autovalidate: true,
        validator: (_) {
          return isEmailValid ? null : 'Неправильный email';
        },
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: 'e-mail',
        ),
      ),
    );
  }
}
