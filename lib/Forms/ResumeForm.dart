import 'package:flutter/material.dart';

class ResumeForm extends StatelessWidget {
  final TextEditingController resumeController;
  ResumeForm({this.resumeController});

  final RegExp _urlRegExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}'
      r'\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.url,
      controller: resumeController,
      validator: validateFunction,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_){
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Ссылка на резюмэ',
        suffix: GestureDetector(
          child: Icon(
            Icons.clear,
            color: Colors.grey,
          ),
          onTap: () => resumeController.clear(),
        ),
      ),
    );
  }
  String validateFunction(String value) {
    if (value.isNotEmpty) {
      if (_urlRegExp.hasMatch(resumeController.text)) {
        return null;
      }
      return 'Некорректные данные';
    }
    return 'Введите данные';
  }
}
