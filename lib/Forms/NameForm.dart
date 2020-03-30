import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  final TextEditingController nameController;

  NameForm({this.nameController});

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
        validator: validateFunction,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          hintText: "Имя",
          suffix: GestureDetector(
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onTap: () => nameController.clear(),
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
