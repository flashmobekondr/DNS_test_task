import 'package:flutter/material.dart';

class PhoneForm extends StatelessWidget {
  final TextEditingController phoneController;
  PhoneForm({this.phoneController});

  final RegExp _phoneRegExp = RegExp(r'^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: phoneController,
        validator: validateFunction,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: 'Телефон',
          suffix: GestureDetector(
            child: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onTap: () => phoneController.clear(),
          ),
        ),
      ),
    );
  }
  String validateFunction(String value) {
    if (value.isNotEmpty) {
      if (_phoneRegExp.hasMatch(phoneController.text)) {
        return null;
      }
      return 'Некорректные данные';
    }
    return 'Введите данные';
  }
}
