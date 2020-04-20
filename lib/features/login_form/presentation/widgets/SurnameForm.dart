import 'package:flutter/material.dart';

class SurnameForm extends StatelessWidget {
  final bool isSurnameValid;
  final TextEditingController surnameController;
  SurnameForm({this.surnameController,this.isSurnameValid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: surnameController,
        autovalidate: true,
        validator: (_) {
          return isSurnameValid ? null : 'Неправильная Фамилия';
        },
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: 'Фамилия',
        ),
      ),
    );
  }
}
