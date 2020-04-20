import 'package:flutter/material.dart';

class PhoneForm extends StatelessWidget {
  final bool isPhoneValid;
  final TextEditingController phoneController;
  PhoneForm({this.phoneController,this.isPhoneValid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: phoneController,
        autovalidate: true,
        validator: (_) {
          return isPhoneValid ? null : 'Неправильный телефон';
        },
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: 'Телефон',
        ),
      ),
    );
  }
}
