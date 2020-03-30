import 'package:flutter/material.dart';

class SurnameForm extends StatelessWidget {
  final TextEditingController surnameController;
  SurnameForm({this.surnameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: surnameController,
        validator: validateFunction,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: 'Фамилия',
          suffix: GestureDetector(
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onTap: () => surnameController.clear(),
          ),
        ),
      ),
    );
  }
  String validateFunction(String value) {
    if (value.isEmpty) {
      return 'Введите данные';
    }
    return null;
  }
}
