import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  final TextEditingController emailController;
  EmailForm({this.emailController});

   final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        validator: validateFunction,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: 'e-mail',
          suffix: GestureDetector(
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onTap: () => emailController.clear(),
          ),
        ),
      ),
    );
  }
  String validateFunction(String value) {
    if (value.isNotEmpty) {
      if (_emailRegExp.hasMatch(emailController.text)) {
        return null;
      }
      return 'Некорректные данные';
    }
    return 'Введите данные';
  }
}
