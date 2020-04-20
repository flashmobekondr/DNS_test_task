import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  final bool isNameValid;
  final TextEditingController nameController;

  NameForm({this.nameController,this.isNameValid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: TextFormField(
        controller: nameController,
        autovalidate: true,
        validator: (_) {
          return isNameValid ? null : 'Неправильное Имя';
        },
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: "Имя",
        ),
      ),
    );
  }
}
